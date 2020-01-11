open Ast
open Error
open Format
open TypeCheck
open X86_64

(* Variáveis globais são armazenadas numa hashtable *)
(* 
 TODO: duvida - no arithc porque hashtable de (string, unit)? *)
(* 
TODO: remover unit se nao for necessario *)
let (genv: (string, nxType * unit) Hashtbl.t) = Hashtbl.create 17

(* Variáveis locais são armazenadas num map *)
module IdMap = Map.Make(String)

(* Tamanho em byte da frame 
(cada variável local ocupa 8 bytes) *)
let frameSize = ref 0

let ifcounter = ref 0

(* Função que verifica que não existem erros de tipagem,
   executada antes de começar a compilar o programa

   TODO: passar esta funçao para modulo auxiliar e usar no interpretador
*)

(* --- função de compilação ---*)

let rec compileStmt env next = function
  
  (* TODO: tratar exceçao not_found *)
  | Svar (x, t, e) -> begin
    try 
      Hashtbl.replace genv x (t, ());
      compileExpr env next e ++
      popq rax ++
      movq (reg rax) (lab x)
    with Not_found -> error "error compileStmt"
  end
  | Sset (x, e) -> begin 
    try 
      (* 
      TODO: testar se neste caso e necessario num statement procurar por
      variaveis locais *)
      let (_, _) = IdMap.find x env in 
      movq (imm 0) (reg rax)
    with Not_found ->
      try 
        let (t, _) = Hashtbl.find genv x in 
        Hashtbl.replace genv x (t, ());
        compileExpr env next e ++
        popq rax ++
        movq (reg rax) (lab x)
      with Not_found -> unboundVarError x
  end

  | Sprint_int (e) -> 
    compileExpr env next e ++
    popq rdi ++
    call ".print_int"
  | Sprint_bool (e) ->
    compileExpr env next e ++
    popq rdi ++
    call ".print_bool"
  | Sif (e, s1, s2) -> 
    ifcounter := !ifcounter +1;
    let ifStmts = List.fold_right (++) (List.map (fun s -> compileStmt env next s) s1) nop in
    let elseStmts = List.fold_right (++) (List.map (fun s -> compileStmt env next s) s2) nop in
    let ifLable = (".if_" ^ string_of_int !ifcounter) in
    let contLable = (".end_if_else_" ^ string_of_int !ifcounter) in

    compileExpr env next e ++
    popq rax ++
    cmpq (imm 1) (reg rax) ++
    (* se condição e retorna true (1), saltar para label .Ln *)
    je ifLable ++
    (* caso contrario, executar o codigo que se segue ao salo«to *)
    elseStmts ++
    (* sair do bloco if else *)
    jmp contLable ++

    label ifLable ++
    ifStmts ++
    jmp contLable ++

    label contLable 
  (* 
  TODO: remover antes de entregar *)

  (*     
    if !frameSize = next then frameSize := 8 + !frameSize;
    compileExpr env next e1 ++ 
    popq rax ++
    movq (reg rax) (ind ~ofs:(-next) rbp) ++
    compileExpr (IdMap.add x (t, next) env) (next + 8) e2
 *)
  | Sforeach (id, e1, e2, stmts) -> 
    let forLabel = (".for_" ^ string_of_int !ifcounter) in
    let contLabel = (".end_for_" ^ string_of_int !ifcounter) in
    
    if !frameSize = next then frameSize := 8 + !frameSize;
    let for_env = IdMap.add id (Tint, next) env in
    let body = List.fold_right (++) (List.map (fun s -> compileStmt for_env next s) stmts ) nop in
    
    (* avaliar valor do limite inferior e1 e move-lo para -next(%rbp) *)

    compileExpr env next e1 ++
    popq rax ++
    movq (reg rax) (ind ~ofs:(-next) rbp) ++

    (* avaliar valor do limite supererior e2 *)
    compileExpr env next e2 ++
    
    (* jmp forLabel ++  TODO: pode nao ser necessario forçar o salto, testar *)
    
    label forLabel ++

    popq rbx ++
    (* testar i < e2
    se i < e2, entao executar corpo do ciclo for e incrementar i;
    caso contrario, saltar para label .cont e continuar a execução do codigo 
    
    at&t troca a ordem dos operandos, por isso jge se 
    *)

    let ofs = (fun (_, n) -> -n) (IdMap.find id for_env) in
    cmpq (ind ~ofs rbp) (reg rbx) ++
    jl contLabel ++
    pushq (reg rbx) ++
    
    body ++
    
    incq (ind ~ofs rbp) ++

    jmp forLabel ++

    label contLabel

and compileExpr env next = function
  | Econst (Cbool b) ->
    movq (imm (if b then 1 else 0)) (reg rax) ++ 
    pushq (reg rax)
  | Econst (Cint i) ->  
      movq (imm i) (reg rax) ++ 
      pushq (reg rax)
  | Eident x -> begin
    try 
    (* procurar pelo identificador x no contexto local *)
      let ofs = (fun (_, n) -> -n) (IdMap.find x env) in 
      movq (ind ~ofs rbp) (reg rax) ++
      pushq (reg rax)
    with Not_found -> 
    (* se x não foi encontrada no ambiente local, 
      procurar pelo identificador x no contexto global *)
      if not (Hashtbl.mem genv x) then unboundVarError x;
      movq (lab x) (reg rax) ++ 
      pushq (reg rax)
  end

  | Ebinop (Bdiv, e1, e2) -> 
    compileExpr env next e1 ++
    compileExpr env next e2 ++
    popq rbx ++ 
    popq rax ++
    movq (imm 0) (reg rdx) ++
    idivq (reg rbx) ++
    pushq (reg rax)

  | Ebinop (Bmod, e1, e2) -> 
    compileExpr env next e1 ++
    compileExpr env next e2 ++
    popq rbx ++
    popq rax ++
    movq (imm 0) (reg rdx) ++
    idivq (reg rbx) ++
    pushq (reg rdx)

  | Ebinop (op, e1, e2) -> begin 
    match op with
    | Beq | Bneq | Bgt | Blt | Bleq | Bgeq -> 
      compileExpr env next e1 ++
      compileExpr env next e2 ++
      popq rax ++
      popq rbx ++
      cmpq (reg rax) (reg rbx) ++
      (bincmp op) (reg dil) ++
      movzbq (reg dil) rax ++
      pushq (reg rax)

    | Badd | Bsub | Bmul | Band | Bor ->   
      compileExpr env next e1 ++
      compileExpr env next e2 ++
      popq rax ++
      popq rbx ++
      (binop op) (reg rbx) (reg rax) ++
      pushq (reg rax) 

    | _ -> invalidOperand ()
    end

  | Eunop (Unot, e) -> 
    compileExpr env next e ++
    popq rdi ++
    notb (reg dil) ++
    xorb (imm 254) (reg dil) ++
    pushq (reg rdi)
  |
   Eunop (Uneg, e) -> 
    compileExpr env next e ++
    popq rax ++
    negq (reg rax) ++
    pushq (reg rax)

  | Elet (x, t, e1, e2) ->
    if !frameSize = next then frameSize := 8 + !frameSize;
    compileExpr env next e1 ++ 
    popq rax ++
    movq (reg rax) (ind ~ofs:(-next) rbp) ++
    compileExpr (IdMap.add x (t, next) env) (next + 8) e2

and bincmp = function
  | Beq  -> sete
  | Bneq -> setne
  | Bgt  -> setg
  | Blt  -> setl
  | Bleq -> setle
  | Bgeq -> setge
  | _ -> invalidOperand ()

and binop = function 
  | Badd -> addq
  | Bsub -> subq
  | Bmul -> imulq
  | Band -> andq 
  | Bor  -> orq
  | _ -> invalidOperand ()

let compileProgram p outFile = 

  typeCheck p;

  let lenv = (IdMap.empty : (nxType * int) IdMap.t) in
  let code = List.map (compileStmt lenv 0) p in
  let code = List.fold_right (++) code nop in
  let p = {
    text = 
      globl "main" ++ label "main" ++
      subq (imm !frameSize) (reg rsp) ++
      leaq (ind ~ofs:(!frameSize - 8) rsp) rbp ++
      code ++
      addq (imm !frameSize) (reg rsp) ++
      movq (imm 0) (reg rax) ++
      ret ++

      (* print int *)
      label ".print_int" ++
      movq (reg rdi) (reg rsi) ++
      movq (ilab ".Sprint_int") (reg rdi) ++
      
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret ++

      (* print bool *)
      label ".print_bool" ++
      cmpq (imm 0) (reg rdi) ++
      je ".print_false" ++
      jne ".print_true" ++
      
      label ".print_true" ++
      movq (reg rdi) (reg rsi) ++
      movq (ilab ".true") (reg rdi) ++      
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret ++

      label ".print_false" ++
      movq (reg rdi) (reg rsi) ++
      movq (ilab ".false") (reg rdi) ++      
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret;

    data = 
      Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l ) genv
      ( label ".Sprint_int" ++ string "%d\n" ++ 
      label ".true" ++ string "true\n" ++ 
      label ".false" ++ string "false\n")
  } in
  let f = open_out outFile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f

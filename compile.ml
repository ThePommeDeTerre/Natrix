open Ast
open Format
open Error
open X86_64
(* TODO: criar modulo de recuperaçao de erros *)

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


(* Função que verifica que não existem erros de tipagem,
   executada antes de começar a compilar o programa

   TODO: passar esta funçao para modulo auxiliar e usar no interpretador
*)
let typeCheck p = 
  let (tenv: (string, nxType) Hashtbl.t) = Hashtbl.create 17 in

  let compareTypes t1 t2 = match t1, t2 with
    | Tint, Tint | Tbool, Tbool -> true
    | Tint, Tbool -> typeError t1 t2
    | Tbool, Tint -> typeError t1 t2 
  in 

  let rec typeStmt env = function
    | Svar (x, t, e) ->
      let te = typeExpr env e in
      if compareTypes te t then 
        Hashtbl.add tenv x te;
        print_endline ("new var: " ^ x)
    | Sset (x, e) -> begin
      try 
        let t = IdMap.find x env in
        ignore(compareTypes t (typeExpr env e))
      with Not_found ->
        try 
          let t = IdMap.find x env in
          ignore(compareTypes t (typeExpr env e))

        with Not_found -> unboundVarError x
    end
    | Sprint (e) -> ignore(typeExpr env e)
    | Sif (e, s1, s2) -> 
      let te = typeExpr env e in
      if compareTypes Tbool te then
        List.iter (fun s -> typeStmt env s) s1;
        List.iter (fun s -> typeStmt env s) s2;
    (* 
    TODO: remover antes de entregar *)
    | _ -> error "not implemented"
  
  and typeExpr env = function
    | Econst (Cint _) -> Tint
    | Econst (Cbool _) -> Tbool
    | Eident x -> begin 
      try
        let t = IdMap.find x env in t
      with Not_found -> 
        try 
          let t = Hashtbl.find tenv x in t
        with Not_found -> unboundVarError x
    end
    | Ebinop (op, e1, e2) -> typeBinOp op (typeExpr env e1) (typeExpr env e2)
    | Eunop (op, e) -> typeUnop op (typeExpr env e)
    | Elet (x, t, e1, e2) -> 
      ignore(compareTypes t (typeExpr env e1));
      let newEnv = IdMap.add x (typeExpr env e1) env in  
      typeExpr newEnv e2

  and typeBinOp op t1 t2 = match t1, t2, op with 
    | Tint, Tint, Badd   -> Tint
    | Tint, Tint, Bsub   -> Tint
    | Tint, Tint, Bmul   -> Tint
    | Tint, Tint, Bdiv   -> Tint
    | Tint, Tint, Bmod   -> Tint
    | Tbool, Tbool, Beq  -> Tbool
    | Tbool, Tbool, Bneq -> Tbool
    | Tbool, Tbool, Bgt  -> Tbool
    | Tbool, Tbool, Blt  -> Tbool
    | Tbool, Tbool, Bleq -> Tbool
    | Tbool, Tbool, Bgeq -> Tbool
    | Tbool, Tbool, Band -> Tbool
    | Tbool, Tbool, Bor  -> Tbool
    | _ -> typeError t1 t2
  and typeUnop op t1 = 
    match op with
    | Uneg -> Tint
    | Unot -> Tbool
  in List.iter (fun s -> typeStmt (IdMap.empty) s) p



(* função de compilação *)

let rec compileStmt env next = function
  | Svar (x, t, e) ->
    Hashtbl.replace genv x (t, ());
    compileExpr env next e ++
    popq rax ++
    movq (reg rax) (lab x)

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
  | Sprint (e) -> 
    compileExpr env next e ++
    popq rdi ++
    call "print_int"

  | Sif (e, s1, s2) -> nop(* TODO of expr * stmt list * stmt list *)
  (* 
  TODO: remover antes de entregar *)
  | _ -> error "not implemented"

and compileExpr env next = function
  | Econst (Cbool b) ->
    movq (imm (if b then 1 else 0)) (reg rax) ++ 
    pushq rax
  | Econst (Cint i) ->  
      movq (imm i) (reg rax) ++ 
      pushq rax

  | Eident x -> begin
    try 
      let ofs = (fun (_, n) -> -n) (IdMap.find x env) in 
      movq (ind ~ofs rbp) (reg rax) ++
      pushq rax
    with Not_found -> 
      if not (Hashtbl.mem genv x) then unboundVarError x;
      movq (lab x) (reg rax) ++ 
      pushq rax
  end

  | Ebinop (Bdiv, e1, e2) -> 
    compileExpr env next e1 ++
    compileExpr env next e2 ++
    popq rbx ++ 
    popq rax ++
    movq (imm 0) (reg rdx) ++
    idivq (reg rbx) ++
    pushq rax

  | Ebinop (Bmod, e1, e2) -> 
    compileExpr env next e1 ++
    compileExpr env next e2 ++
    popq rbx ++
    popq rax ++
    movq (imm 0) (reg rdx) ++
    idivq (reg rbx) ++
    pushq rdx

  | Ebinop (op, e1, e2) -> 
    (* 
    TODO: lançar exceção caso e2 seja avaliada para 0 *)
    compileExpr env next e1 ++
    compileExpr env next e2 ++
    popq rax ++
    popq rbx ++
    (binop op) (reg rbx) (reg rax) ++
    pushq rax

  | Eunop (op, e) -> 
    compileExpr env next e ++
    popq rax ++
    (unop op) (reg rax) ++
    pushq rax

  | Elet (x, t, e1, e2) ->
    if !frameSize = next then frameSize := 8 + !frameSize;
    compileExpr env next e1 ++ 
    popq rax ++
    movq (reg rax) (ind ~ofs:(-next) rbp) ++
    compileExpr (IdMap.add x (t, next) env) (next + 8) e2

and binop = function 
  | Badd -> addq
  | Bsub -> subq
  | Bmul -> imulq
  | Band -> andq 
  | Bor  -> orq
  (*| Beq  -> nop  TODO *)
  (*| Bneq -> nop  TODO *)
  (*| Bgt  -> nop  TODO *)
  (*| Blt  -> nop  TODO *)
  (*| Bleq -> nop  TODO *)
  (*| Bgeq -> nop  TODO *)
  | _ -> invalidOperand ()

and unop = function
  | Uneg -> negq
  | Unot -> notq


let compileProgram p outFile = 

  typeCheck p;

  let lenv = (IdMap.empty : (nxType * int) IdMap.t) in
  let code = List.map (compileStmt lenv 0) p in
  let code = List.fold_right (++) code nop in
  let p = {
    text = 
      glabel "main" ++
      subq (imm !frameSize) (reg rsp) ++
      leaq (ind ~ofs:(!frameSize - 8) rsp) rbp ++
      code ++
      addq (imm !frameSize) (reg rsp) ++
      movq (imm 0) (reg rax) ++
      ret ++
      (* adicionar print bool *)
      label "print_int" ++
      movq (reg rdi) (reg rsi) ++
      movq (ilab ".Sprint_int") (reg rdi) ++
      
      movq (imm 0) (reg rax) ++
      call "printf" ++
      ret;

    data = 
      Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l ) genv
        (label ".Sprint_int" ++ string "%d\n")
  } in

  let f = open_out outFile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f

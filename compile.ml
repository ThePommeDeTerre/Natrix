open Format
open X86_64
open Ast
(* TODO: criar modulo de recuperaçao de erros *)
exception Error of string
let error s = raise (Error s)

(* Variáveis globais são armazenadas numa hastable *)
let (genv: (string, nxType * unit) Hashtbl.t) = Hashtbl.create 17
(* Variáveis locais são armazenadas num map *)
module IdMap = Map.Make(String)


let typeCheck p = 
  let (tenv: (string, nxType) Hashtbl.t) = Hashtbl.create 17 in

  let compareTypes t1 t2 = match t1, t2 with
    | Tint, Tint | Tbool, Tbool -> true
    | Tint, Tbool -> error "type error"
    | Tbool, Tint -> error "type error" 
  in 

  let rec typeStmt env = function
    | Svar (x, t, e) ->
      let te = typeExpr env e in
      if compareTypes t te then 
        Hashtbl.add tenv x te 
    | Sset (x, e) -> begin
      try 
        let t = IdMap.find x env in
        ignore(compareTypes t (typeExpr env e))
      with Not_found ->
        try 
          let t = IdMap.find x env in
          ignore(compareTypes t (typeExpr env e))
        with Not_found -> error ("Unbound value " ^ x)
    end
    | Sprint (e) -> ignore(typeExpr env e)
    | Sif (e, s1, s2) -> 
      let te = typeExpr env e in
      if compareTypes Tbool te then
        List.iter (fun s -> typeStmt env s) s1;
        List.iter (fun s -> typeStmt env s) s2;
    | _ -> error "not implemented"
  
  and typeExpr env = function
    | Econst (Cint _) -> Tint
    | Econst (Cbool _) -> Tbool
    | Eident x -> begin 
      try
        let t = IdMap.find x env in t
      with Not_found -> error ("Unbound value " ^ x)
    end
    | Ebinop (op, e1, e2) -> typeOp op (typeExpr env e1) (typeExpr env e2)
    | Eunop (op, e) -> ()
    | Elet (x, t, e1, e2) -> ()

  and typeOp op t1 t2 = match op with 
    | Badd -> 
    | Bsub -> ()
    | Bmul -> ()
    | Bdiv -> ()
    | Bmod -> ()
    | Beq  -> ()
    | Bneq -> ()
    | Bgt  -> ()
    | Blt  -> ()
    | Bleq -> ()
    | Bgeq -> ()
    | Band -> ()
    | Bor  -> ()

  and typeUnop env = function
    | Uneg -> 
    | Unot -> ()

  in List.iter (fun s -> typeStmt (IdMap.empty) s) p

let rec compileStmt env = function
  | Svar (x, t, e)  -> nop(* of ident * nxType * expr *)
  | Sset (x, e)     -> nop(* of ident * expr *)
  | Sprint (e)      -> nop(* of expr *)
  | Sif (e, s1, s2) -> nop(* of expr * stmt list * stmt list *)
  | _ -> error "not implemented"


(* TODO: COMO FAZER TIPAGEM NISTO? *)
and compileExpr env next = function
  | Econst c            -> nop
  | Eident x            -> nop
  | Ebinop (op, e1, e2) -> nop
  | Eunop (op, e)       -> nop
  | Elet (x, t, e1, e2) -> nop

and binop = function 
  | Badd -> nop
  | Bsub -> nop
  | Bmul -> nop
  | Bdiv -> nop
  | Bmod -> nop
  | Beq  -> nop
  | Bneq -> nop
  | Bgt -> nop
  | Blt -> nop
  | Bleq -> nop
  | Bgeq -> nop
  | Band -> nop
  | Bor -> nop

and unop = function
  | Uneg -> nop
  | Unot -> nop




(* Tamanho em byte da frame 
(cada variável local ocupa 8 bytes) *)
let frameSize = ref 0


let compileProgram p outFile = 
  let lenv = (IdMap.empty : (nxType * unit) IdMap.t) in
  let code = List.map (compileStmt lenv) p in
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

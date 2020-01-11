open Ast
open TypeCheck
open Error

type value = 
  | Vbool of bool
  | Vint of int

let typeOfValue = function 
  | Vbool _ -> Tbool
  | Vint _ -> Tint


(* Variáveis globais são armazenadas numa hastable *)
let genv = Hashtbl.create 17


(* Variáveis locais são armazenadas num map *)
module IdMap = Map.Make(String)

let rec printValue = function
| Vint n -> Printf.printf "%d\n" n
| Vbool b -> Printf.printf "%b\n" b


(* nota: 
como definimos que o let x = e1 in e2 so e
valido dentro de expressoes, nao e necessario pesquisar
identificadores em ambientes locais *)
let rec stmt env = function
  | Svar (x, t, e) -> 
    let v = (expr env e) in
    if compareTypes t (typeOfValue v) then Hashtbl.replace genv x (t, v)
  | Sset (x, e) -> 
    begin
      let v = (expr env e) in
      try 
        let t, _ = Hashtbl.find genv x in 
        if compareTypes t (typeOfValue v) then Hashtbl.replace genv x (t, v) 
      with Not_found -> unboundVarError x
    end
  | Sprint_int (e) -> printValue (expr env e)
  | Sprint_bool (e) -> printValue (expr env e)
  | Sif (e, s1, s2)-> 
    begin
      let v = expr env e in
      match v with 
      | Vbool true -> List.iter (fun s -> stmt env s) s1
      | Vbool false -> List.iter (fun s -> stmt env s) s2
      | _ -> typeError Tbool (typeOfValue v)
    end 

    | Sforeach (id, e1, e2, stmts) ->
      match expr env e1, expr env e2 with
      | Vint v1, Vint v2  -> 
        let intpr_stmt i s = 
          (* adicionar id ao ambiente local iniciado a v1*)
            stmt (IdMap.update id (fun _ -> Some (Tint, Vint i)) env) s 
        in for i = v1 to v2 do
          List.iter (fun s -> intpr_stmt i s) stmts
        done
      | _ -> error "todo" 
      
and expr env = function
  | Econst (Cint i) -> Vint i
  | Econst (Cbool b) -> Vbool b
  | Eident x -> begin
    try 
      let _, v = (IdMap.find x env) in v
      with Not_found ->
        try
          let _, v = Hashtbl.find genv x in v
        with Not_found -> unboundVarError x
    end
  | Ebinop (op, e1, e2) -> binop op (expr env e1) (expr env e2)
  | Eunop  (op, e) -> unop op (expr env e)
    (* local *)
  | Elet (x, t, e1, e2) ->
  (* IdMap.update encontra o valor com a chave x e: 
    - se x existir, substitui o valor correspondente a x por (tipo, valor) 
      -> atualiza o valor de x
    - se x nao existir, cria uma nova entrada com chave x
  *)
    let v = expr env e1 in
    let newenv = IdMap.update x (fun _ -> Some (t, v)) env in 
    expr newenv e2

and binop op v1 v2 =
  match op, v1, v2 with
  | Band, Vbool b1, Vbool b2 -> Vbool (b1 && b2)
  | Bor,  Vbool b1, Vbool b2 -> Vbool (b1 || b2)
  | Badd, Vint n1, Vint n2   -> Vint (n1 + n2)
  | Bsub, Vint n1, Vint n2   -> Vint (n1 - n2) 
  | Bmul, Vint n1, Vint n2   -> Vint (n1 * n2)
  | Bdiv, Vint n1, Vint n2   -> Vint (n1 / n2)
  | Bmod, Vint n1, Vint n2   -> Vint (n1 mod n2)
  | Beq, _, _  -> Vbool (compare v1 v2 == 0)
  | Bneq, _, _ -> Vbool (compare v1 v2 != 0)
  | Bgt, _, _  -> Vbool (compare v1 v2 > 0)
  | Blt, _, _  -> Vbool (compare v1 v2 < 0)
  | Bgeq, _, _ -> Vbool (compare v1 v2 >= 0)
  | Bleq, _, _ -> Vbool (compare v1 v2 <= 0)
  | _ -> invalidOperand ()
  
and unop op v = 
  match op, v with
  | Uneg, Vint n  -> Vint (-n) 
  | Unot, Vbool b -> Vbool (not b)
  | _ -> invalidOperand () 


let intr_program p =  
  typeCheck p;
  let lenv = (IdMap.empty : (nxType * value) IdMap.t) in
  List.iter (fun s -> stmt lenv s) p


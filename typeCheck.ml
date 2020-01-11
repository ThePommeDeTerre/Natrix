open Ast
open Error


module IdMap = Map.Make(String)

let compareTypes t1 t2 = match t1, t2 with
| Tint, Tint | Tbool, Tbool -> true
| _, _ -> typeError t1 t2



let typeCheck p = 
  let (tenv: (string, nxType) Hashtbl.t) = Hashtbl.create 17 in

  let rec typeStmt env = function
    | Svar (x, t, e) -> begin
      try
        let te = typeExpr env e in
        if compareTypes te t then 
          Hashtbl.add tenv x te;
      with Not_found -> unboundVarError x
    end
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
    | Sprint_int  (e) -> ignore(compareTypes Tint (typeExpr env e))
    | Sprint_bool (e) -> ignore(compareTypes Tbool (typeExpr env e))
    | Sif (e, s1, s2) ->
      let te = typeExpr env e in
      if compareTypes Tbool te then
        List.iter (fun s -> typeStmt env s) s1;
        List.iter (fun s -> typeStmt env s) s2;
    | Sforeach (id, e1, e2, stmts) -> 
      if compareTypes Tint (typeExpr env e1) && compareTypes Tint (typeExpr env e2) then  
        let for_env = IdMap.add id (Tint) env in
        List.iter (fun s -> typeStmt for_env s) stmts
  
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
    | Tint, Tint, Badd -> Tint
    | Tint, Tint, Bsub -> Tint
    | Tint, Tint, Bmul -> Tint
    | Tint, Tint, Bdiv -> Tint
    | Tint, Tint, Bmod -> Tint
    | Tint, Tint, Beq  -> Tbool
    | Tint, Tint, Bneq -> Tbool
    | Tint, Tint, Bgt  -> Tbool
    | Tint, Tint, Blt  -> Tbool
    | Tint, Tint, Bleq -> Tbool
    | Tint, Tint, Bgeq -> Tbool
    | Tbool, Tbool, Band -> Tbool
    | Tbool, Tbool, Bor  -> Tbool
    | _ -> typeError t1 t2
  and typeUnop op t1 = 
    match op with
    | Uneg -> Tint
    | Unot -> Tbool
  in List.iter (fun s -> typeStmt (IdMap.empty) s) p



open Ast

let print_tree p =
  let rec print_stmts = function
    | [] -> ""
    | h::t -> print_stmt h ^ "\n" ^ print_stmts t 

  and print_stmt = function 
    | Svar (ident, t, e) -> "var " ^ ident ^ " : " ^ (print_type t) ^ " = " ^(print_expr e) ^ ";"
    | Sset (ident, e) -> ident ^ ":=" ^ (print_expr e) ^ ";"
    | Sprint e -> "print(" ^ (print_expr e) ^ ")" ^ ";"
    | Sif (e, s1, s2) -> 
      "if " ^ print_expr e ^ " then{\n" ^ print_stmts s1 ^ "}\n" ^ 
      "else {\n" ^ print_stmts s2 ^ "}"
    | Sforeach (e, s) -> "not implemented yet"
    | Stype s -> "not implemented yet"

  and print_expr = function
    | Econst c -> print_const c
    | Eident s -> s
    | Ebinop (op, e1, e2) -> print_expr e1 ^ print_bin_op op ^ print_expr e2
    | Eunop (op, e) -> begin
      match op with 
      | Uneg -> "-" ^ print_expr e
      | Unot -> "!" ^ print_expr e
    end
    | Elet (id, t, e1, e2) -> 
      "let " ^ id ^ ":" ^ print_type t ^ " = " ^ print_expr e1 ^ " " ^ " in " ^ print_expr e2
  and print_type = function  
    | Tint  -> "int"
    | Tbool -> "bool"

  and print_const = function
    | Cbool b -> string_of_bool b
    | Cint i -> string_of_int i

  and print_bin_op = function
    | Badd -> "+"
    | Bsub -> "-"
    | Bmul -> "*"
    | Bdiv -> "/"
    | Bmod -> " mod "
    | Beq  -> "=="
    | Bneq -> "!="
    | Bgt  -> ">"
    | Blt  -> "<"
    | Bleq -> "<="
    | Bgeq -> ">="
    | Band -> "&"
    | Bor  -> "|"
  in print_endline (print_stmts p) 

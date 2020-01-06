open Ast
open Lexing

exception RaiseError of string

(* localiza linha e coluna do erro *)
let localisation pos inFile =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  Printf.printf "File \"%s\", line %d, characters %d-%d:\n" !inFile l (c-1) c

let error s = raise (RaiseError s)

let unboundVarError x = error ("Unbound value " ^ x)

let typeError t1 t2 =
  let string_of_type = function 
    | Tint -> "int"
    | Tbool -> "bool"
  in let s = "Type error: This expression has type " ^ (string_of_type t2) ^ 
             " but an expression was expected of type " ^ (string_of_type t1)
  in error s

let invalidOperand () = error "Invalid operand"

let divisionBy0 () = error "Division by zero"
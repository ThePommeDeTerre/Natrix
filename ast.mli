
(* tipo Identificadores *)
type ident = string


(* Constantes *)
type constant = 
  | Cbool of bool
  | Cint of int

(* Operadores unários *)
type unop =
  | Uneg
  | Unot


type binop =
  | Badd | Bsub | Bmul | Bdiv
  | Beq  | Bneq | Bgt | Blt | Bleq | Bgeq
  | Band | Bor

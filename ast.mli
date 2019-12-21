
(* tipo Identificadores *)
type ident = string

(* Constantes *)
type constant = 
  | Cbool of bool
  | Cint of int

(* Tipos *)
type nType =
  | Tint
  | Tbool

(* Operadores unários *)
type unop =
  | Uneg
  | Unot

(* Operadores binários *)
type binop =
  | Badd | Bsub | Bmul | Bdiv
  | Beq  | Bneq | Bgt | Blt | Bleq | Bgeq
  | Band | Bor
  

type program = def list * stmt list 
and  def     = ident * ident list * stmt

(* nota: este tipo esta ordenado por ordem de prioridade, 
  vamos tentar implementar cada um por esta ordem*)
and stmt = 
  | Svar     of ident * nType * expr
  | Sset     of ident * expr
  | Sprint   of expr
  | Sif      of expr * stmt * stmt
  | Sforeach of expr * stmt
  | Stype    of ident 
  
and expr = 
  | Econst of constant
  | Eident of ident
  | Ebinop of binop * expr * expr
  | Eunop  of unop * expr 
  | Elet   of ident * nType * expr * expr


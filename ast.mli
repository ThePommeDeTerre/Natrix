type program = stmt list

and stmt = 
  | Svar        of ident * nxType * expr
  | Sset        of ident * expr
  | Sprint_bool of expr
  | Sprint_int  of expr
  | Sif         of expr * stmt list * stmt list
  | Sforeach    of ident * expr * expr * stmt list
  
and expr = 
  | Econst of constant
  | Eident of ident
  | Ebinop of binop * expr * expr
  | Eunop  of unop * expr 
  | Elet   of ident * nxType * expr * expr

(* tipo Identificadores *)
and ident = string

(* Tipos *)
and nxType =
  | Tint
  | Tbool
  (* | Trange *)

(* Constantes *)
and constant = 
  | Cbool of bool
  | Cint of int
(* | Crange of int * int *)

(* Operadores unários *)
and unop =
  | Uneg
  | Unot

(* Operadores binários *)
and binop =
  | Badd | Bsub | Bmul | Bdiv | Bmod
  | Beq  | Bneq | Bgt | Blt | Bleq | Bgeq
  | Band | Bor
  


(* type program = def list * stmt list 
and  def     = ident * ident list * stmt *)

(* nota: este tipo esta ordenado por ordem de prioridade, 
  vamos tentar implementar cada um por esta ordem*)

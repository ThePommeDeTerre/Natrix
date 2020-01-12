type program = stmt list
(** Tipo programa. Um programa é constituido por uma lista de instruções ([stmt]). *)


and stmt = 
| Svar        of ident * nxType * expr
| Sset        of ident * expr
| Sprint_bool of expr
| Sprint_int  of expr
| Sif         of expr * stmt list * stmt list
| Sforeach    of ident * expr * expr * stmt list
(** Tipo intrução. *)

and expr = 
| Econst of constant
| Eident of ident
| Ebinop of binop * expr * expr
| Eunop  of unop * expr 
| Elet   of ident * nxType * expr * expr
(** Tipo expressão. *)
  

and ident = string
(** Tipo Identificadores. Cada identificador é identificado por uma string. *)
  
and nxType =
| Tint
| Tbool
(** Tipos reconhecidos.*)

and constant = 
| Cint of int
| Cbool of bool
(** Tipo constantes. *)

and unop =
| Uneg
| Unot
(** Operadores unários *)

and binop =
| Badd | Bsub | Bmul | Bdiv | Bmod
| Beq  | Bneq | Bgt | Blt | Bleq | Bgeq
| Band | Bor
(** Operadores binários, incluêm operações inteiras e booleanas.*)

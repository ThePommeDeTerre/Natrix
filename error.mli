exception Error of string

val localisation : Lexing.position -> string ref -> unit
(** [localisation pos inFile] Localiza a linha e coluna do erro. *)


val unboundVarError : string -> 'a
(** [unboundVarError] levanta exceção [Error s] quando *)

val typeError: Ast.nxType -> Ast.nxType -> 'a


val invalidOperand : unit -> 'a
exception RaiseError of string

val localisation : Lexing.position -> string ref -> unit
(** [localisation pos inFile] Localiza a linha e coluna do erro *)

val error : string -> 'a
(** [error s] levanta uma exceção [RaiseError] *)

val unboundVarError : string -> 'a

val typeError: Ast.nxType -> Ast.nxType -> 'a

val invalidOperand : unit -> 'a
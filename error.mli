exception RaiseError of string

val localisation : Lexing.position -> string ref -> unit
val error : string -> 'a

val unboundVarError : string -> 'a
val typeError: Ast.nxType -> Ast.nxType -> 'a
val invalidOperand : unit -> 'a
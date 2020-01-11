
(* The type of tokens. *)

type token = 
  | VAR
  | THEN
  | SET
  | SCOL
  | RP
  | RB
  | RANGE
  | PRINTINT
  | PRINTBOOL
  | PLUS
  | OR
  | NOT
  | MUL
  | MOD
  | MINUS
  | LP
  | LET
  | LB
  | INT
  | IN
  | IF
  | IDENT of (string)
  | FOR
  | EQ
  | EOF
  | ELSE
  | DO
  | DIV
  | CONST of (Ast.constant)
  | COL
  | CMP of (Ast.binop)
  | BOOL
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)

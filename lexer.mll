(* Lexer para Natrix*)

{
  open Lexing
  open Parser

  exception Lexing_error of char


  (* 
  TODO: guardar tabela de keywords numa hashtable 
  *)

  (* tokens nao utilizados:
    "def",     DEF;
    "arry",    ARRAY;
    "filled",  FILLED;
    "type",    TYPE;
    "do",      DO;
    "of",      OF;
    "by",      BY;
    "size",    SIZE;
    "foreach", FOR;
| ".."          { RANGE }
| ','           { COM }
| '['           { SLB }
| ']'           { SRB }

    *)
  let kwd_tbl = [
    "if",      IF;
    "then",    THEN;
    "else",    ELSE;
    "print",   PRINT;
    "mod",     MOD;
    "in",      IN;
    "var",     VAR;
    "let",     LET;
    "true",    CONST (Cbool true);
    "false",   CONST (Cbool false);
    "int", INT;
    "bool", BOOL
  ]

  let kwd_or_id s = 
  try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf = 
    let pos = lexbuf.lex_curr_p in 
    lexbuf.lex_curr_p <- 
      {pos with pos_lnum = pos.pos_lnum  + 1; pos_bol = pos.pos_cnum}
}

let letter = ['a' - 'z' 'A' - 'Z']
let digit = ['0' - '9']
let space = [' ' '\t']

let ident = letter(letter | digit)*
let integer = digit+

rule token = parse
| '\n'          { newline lexbuf; token lexbuf }
| "//" [^'\n']+ { newline lexbuf; token lexbuf }
| space+        { token lexbuf }
| ident as id   { kwd_or_id id }
| ';'           { SCOL }
| ':'           { COL }
| ":="          { SET }
| '('           { LP }  
| ')'           { RP }
| '{'           { LB }
| '}'           { RB }
| '+'           { PLUS } 
| '-'           { MINUS } 
| '/'           { DIV }
| '*'           { MUL }
| '='           { EQ }
| "=="          { CMP Beq }
| "!="          { CMP Bneq }
| "<"           { CMP Blt }
| "<="          { CMP Bleq }
| ">"           { CMP Bgt }
| ">="          { CMP Bgeq }
| '!'           { NOT }
| '&'           { AND }
| '|'           { OR }
| integer as s  { CONST (Cint (int_of_string s)) }
| eof           { EOF }
| _ as c        {raise (Lexing_error c) }
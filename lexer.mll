{
  open Lexing
  open Parser

  exception Lexing_error of string

  let kwd_tbl = [
    "def", DEF;
    "if", IF;
    "then", THEN;
    "else", ELSE;
    "print", PRINT;
    "foreach", FOR;
    "in", IN;
    "do", DO;
    "type", TYPE;
    "var", VAR;
    "of", OF;
    "arry", ARRAY;
    "filled", FILLED; 
    "by", BY;
    "let", LET;
    "size", SIZE;
    "true", CONST(Cbool true);
    "false", CONST(Cbool false)
  ]

  exception Lexing_error of char

  let kwd_or_id s = try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf = 
    let pos = lexbuf.lex_curr_p in 
    lexbuf.lex_curr_p <- {pos with pos_lnum = pos.pos_lnum  + 1; pos_bol = pos.pos_cnum}
}

let letter = ['a' - 'z' 'A' - 'Z']
let digit = ['0' - '9']

let ident = letter(letter | digit)*
let integer = digit+
let space = [' ' '\t']

rule token = parse
| '\n' {newline lexbuf; token lexbuf}
| "//" [^'\n']+ {newline lexbuf; token lexbuf}
| space+ {token lexbuf}
| ident as id {kwd_or_id}
| ';'
| ".."
| ','
| ':'
| ":="
| '('
| ')'
| '{'
| '}'
| '['
| ']'
| '+'
| '-'
| '/'
| '='
| '*'
| "=="
| "!="
| "<"
| "<="
| ">"
| ">="
| '&'
| '|'
| integer as s {CONST (Cint int_of_string s)}
| eof
| _ as c {raise (Lexing_error c)}
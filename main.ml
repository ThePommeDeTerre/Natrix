open Lexing
open Ast
open Format

let parse_only = ref true

let inFile  = ref ""
let outFile = ref ""

let set_file f s = f := s


let options =
  ["-parse-only", Arg.Set parse_only,
   "  Executar somente o parsing";
   "-o", Arg.String (set_file outFile),
   "<file>  Para indicar o nome do ficheiro em saída"]

let usage = "usage: arithc [option] file.exp"


let rec print_stmts = function
| [] -> ""
| h::t -> print_stmt h ^ "\n" ^ print_stmts t 

and print_stmt = function 
  | Svar (ident, t, e) -> "var " ^ ident ^ " : " ^ (print_type t) ^ " = " ^(print_expr e) ^ ";"
  | Sset (ident, e) -> ident ^ ":=" ^ (print_expr e) ^ ";"
  | Sprint e -> "print(" ^ (print_expr e) ^ ")" ^ ";"
  | Sif (e, s1, s2) -> 
    "if " ^ print_expr e ^ " then{\n" ^ print_stmts s1 ^ "}\n" ^ 
    "else {\n" ^ print_stmts s2 ^ "}"
  | Sforeach (e, s) -> "not implemented yet"
  | Stype s -> "not implemented yet"

and print_expr = function
| Econst c -> print_const c
| Eident s -> s
| Ebinop (op, e1, e2) -> print_expr e1 ^ print_bin_op op ^ print_expr e2
| Eunop (op, e) -> begin
  match op with 
  | Uneg -> "-" ^ print_expr e
  | Unot -> "!" ^ print_expr e
end
| Elet (id, t, e1, e2) -> 
  "let " ^ id ^ ":" ^ print_type t ^ " = " ^ print_expr e1 ^ " " ^ " in " ^ print_expr e2
and print_type = function  
  | Tint  -> "int"
  | Tbool -> "bool"

and print_const = function
  | Cbool b -> string_of_bool b
  | Cint i -> string_of_int i

and print_bin_op = function
| Badd -> "+"
| Bsub  -> "-"
| Bmul  -> "*"
| Bdiv -> "/"
| Beq   -> "=="
| Bneq  -> "!="
| Bgt  -> ">"
| Blt  -> "<"
| Bleq  -> "<="
| Bgeq -> ">="
| Band  -> "&"
| Bor -> "|"

let localisation pos =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" !inFile l (c-1) c


let () = 

  Arg.parse options (set_file inFile) usage;

  if !inFile = "" then begin 
    print_string("Nenhum ficheiro inserido\n"); exit 1 
  end;

  if not (Filename.check_suffix !inFile ".nx") then begin
    print_string("Ficheiro deve ter extensão .nx\n"); 
    exit 1;
  end;

  if !outFile = "" then outFile := Filename.chop_suffix !inFile ".nx";

  let f = open_in !inFile in

  let buf = Lexing.from_channel f in

    try
      let p = Parser.prog Lexer.token buf in close_in f; 
      print_endline (print_stmts p);
      print_endline "all ok";
      exit 0

    with 
    | Lexer.Lexing_error c -> 
      print_string "Erro na análise lexica\n";
      localisation (Lexing.lexeme_start_p buf);
      exit 1
    | Parser.Error -> 
      localisation (Lexing.lexeme_start_p buf);
      eprintf "Erro durante a análise sintáctica@.";
      exit 1


  
open Ast
open Format
open Lexing
open Interp


let parse_only = ref true
let interp = ref true

let inFile  = ref ""
let outFile = ref ""

let set_file f s = f := s

(* opções do natrix que são mostradas ao invocar 'natrix --help' *)
let options =
  ["-parse-only", Arg.Set parse_only,
   "  Executar somente o parsing";
   "-i", Arg.Set interp,
   " Executar interpretador";
   "-o", Arg.String (set_file outFile),
   "<file>  Para indicar o nome do ficheiro em saída"]

let usage = "usage: arithc [option] file.exp"

(* localiza linha e coluna do erro *)
let localisation pos =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" !inFile l (c-1) c


let () = 
  (* parsing da linha de comandos *)
  Arg.parse options (set_file inFile) usage;

  (* verificar se foi introduzido um ficheiro *)
  if !inFile = "" then begin 
    print_string("Nenhum ficheiro inserido\n"); exit 1 
  end;

  (* verificar se a extensão do ficheiro está correta *)
  if not (Filename.check_suffix !inFile ".nx") then begin
    print_string("Ficheiro deve ter extensão .nx\n"); 
    exit 1;
  end; 

  (* caso o natrix seja executado em modo interpretador *)
  if not !interp then
    (* o ficheiro de output terá a extensão .s *)
    if !outFile = "" then outFile := Filename.chop_suffix !inFile ".nx" ^ ".s";

  let f = open_in !inFile in
  
  (* criação do buffer de análise léxica*)
  let buf = Lexing.from_channel f in

    try
      let p = Parser.prog Lexer.token buf in close_in f; 
        if !interp then 
          intr_program p
        else 
          printf "compile code goes here";
      exit 0

    with 
    | Lexer.Lexing_error c -> 
      print_endline "Erro na análise lexica";
      localisation (Lexing.lexeme_start_p buf);
      exit 1

    | Parser.Error -> 
      print_endline "Erro durante a análise sintáctica.";
      localisation (Lexing.lexeme_start_p buf);
      exit 1


  
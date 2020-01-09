open Ast
open Format
open Lexing
open Interp
open Error

let parse_only = ref true
let interp = ref false

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

  (* caso o natrix seja executado em modo  *)
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
          Compile.compileProgram p !outFile;
    with 
    | Lexer.Lexing_error c -> 
      localisation (Lexing.lexeme_start_p buf) inFile;
      print_endline ("Erro na análise lexica: ");
      exit 1

    | Parser.Error -> 
      localisation (Lexing.lexeme_start_p buf) inFile;
      print_endline "Syntax error";
      exit 1

    | RaiseError s -> 
      (* localisation (Lexing.lexeme_start_p buf) inFile; *)
      print_endline s;
      exit 1


  
%{
  open Ast
%}

%token <Ast.constant> CONST
%token <Ast.binop> CMP
%token <string> IDENT



/* TODO tokens por implementar: 
%token DEF ARRAY FILLED BY COM RANGE FOR DO TYPE SIZE OF
%token SLB SRB

*/

%token IF THEN ELSE PRINT LET IN VAR SET 
%token EQ SCOL COL NOT AND OR
%token PLUS MINUS DIV MUL
%token INT BOOL
%token EOF
%token LP RP LB RB

/* definição de prioridades */ 

%left AND 
%left OR
%nonassoc IN
%nonassoc NOT
%nonassoc CMP
%left PLUS 
%left MINUS
%left DIV 
%left MUL

/* ponto de entrada da gramática */
%start program

/* tipo dos valores devolvidos pelo analizador */
%type <Ast.program> program

%% 

/* tentar primeiro sem definiçoes */
/* TODO: Alterar prioridade do nao terminal ';' 
*/
program:
| p = stmts EOF {List.rev p}
;

stmts:
| i = stmt;  SCOL           { [i] }
| l = stmts; SCOL i = stmt { i :: l }
;

stmt:
| VAR; id = IDENT; COL; t = types; EQ; e = expr { Svar (id, t, e) }
| id = IDENT; SET; e = expr       { Sset (id, e) }
| PRINT; LP; e = expr; RP        { Sprint e }
| IF; e = expr; THEN; LB; s1 = stmts; RB 
  ELSE; LB; s2 = stmts; RB       { Sif (e, s1, s2) }
;

types:
| INT {Tint}
| BOOL {Tbool}
;

expr:
| c = CONST                    { Econst c }
| id = IDENT                   { id }
| e1 = expr; o = op; e2 = expr { Ebinop (o, e1, e2) }
| NOT; e = expr {Eunop e} 
| LET; id = IDENT; COL; t = types; EQ; e1 = expr; 
  IN e2 = expr                 {Elet (id, t, e)}

%inline op:
| PLUS  { Badd }
| MINUS { Bsub }
| DIV   { Bdiv }
| MUL   { Bmul }
| c=CMP {c}
| AND   {Band}
| OR    {Bor}




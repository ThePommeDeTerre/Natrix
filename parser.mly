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
%start prog

/* tipo dos valores devolvidos pelo analizador */
%type <Ast.program> prog
%% 

prog:
| p=stmts EOF { p }


/* *todos* os statements separados por ;
stmts:
| x = stmt SCOL { [x] }
| x = stmt SCOL xs = stmts  {x :: xs} */

/* 
stmts: 
| s_list = separated_list(SCOL, stmt) SCOL {s_list}

stmts:
| i=stmt SCOL         { [i] }
| l=stmts i=stmt SCOL { i :: l } */


stmts:
| x = stmt { [x] }
| x = stmt xs = stmts  {x :: xs} 


stmt:
| VAR id = IDENT COL t = types EQ e = expr SCOL { Svar (id, t, e) }
| id = IDENT SET e = expr SCOL                  { Sset (id, e) }
| PRINT LP e = expr RP SCOL                     { Sprint e }
| IF e = expr THEN LB s1 = stmts RB 
  ELSE LB s2 = stmts RB                         { Sif (e, s1, s2) }
;

types:
| INT  {Tint}
| BOOL {Tbool}
;

expr:
| c = CONST                    { Econst c }
| id = IDENT                   { Eident id }
| e1 = expr o = op e2 = expr   { Ebinop (o, e1, e2) }
| NOT e = expr                 {Eunop (Uneg, e)} 
| LET id = IDENT COL t = types EQ e1 = expr 
  IN e2 = expr                 {Elet (id, t, e1, e2)}
;

%inline op:
| PLUS  { Badd }
| MINUS { Bsub }
| DIV   { Bdiv }
| MUL   { Bmul }
| c=CMP {c}
| AND   {Band}
| OR    {Bor}
;



# Natrix

## Índice
- [Natrix](#natrix)
  - [Índice](#%c3%8dndice)
- [Entrega](#entrega)
  - [_Deadlines_](#deadlines)
    - [29/10/2019 — Exercício 1](#29102019--exerc%c3%adcio-1)
    - [19/11/2019 — Exercícios 2, 3, 4 e 5](#19112019--exerc%c3%adcios-2-3-4-e-5)
    - [10/12/2019 — Exercícios 6, 7 e 8](#10122019--exerc%c3%adcios-6-7-e-8)
    - [Última Semana de Aulas — Exercício 9](#%c3%9altima-semana-de-aulas--exerc%c3%adcio-9)
- [Sintaxe](#sintaxe)
  - [Comentários](#coment%c3%a1rios)
  - [Constantes por Omissão na Linguagem](#constantes-por-omiss%c3%a3o-na-linguagem)
  - [Funções por Omissão na Linguagem](#fun%c3%a7%c3%b5es-por-omiss%c3%a3o-na-linguagem)
  - [Definição de Intervalos](#defini%c3%a7%c3%a3o-de-intervalos)
  - [Arrays](#arrays)
    - [Exemplo](#exemplo)
  - [Definição de Tipos](#defini%c3%a7%c3%a3o-de-tipos)
  - [Variáveis](#vari%c3%a1veis)
    - [Arrays](#arrays-1)
    - [Atribuições e Expressões Numéricas](#atribui%c3%a7%c3%b5es-e-express%c3%b5es-num%c3%a9ricas)
  - [Instrução condicional clássica `if`](#instru%c3%a7%c3%a3o-condicional-cl%c3%a1ssica-if)
  - [Ciclos determinísticos](#ciclos-determin%c3%adsticos)
    - [Exemplos](#exemplos)
- [_Lexer_](#lexer)
  - [Expressões Regulares Auxiliares](#express%c3%b5es-regulares-auxiliares)
  - [Palavras Chave](#palavras-chave)
  - [_Tokens_](#tokens)
- [Por Decidir](#por-decidir)
- [Referências](#refer%c3%aancias)

---

# Entrega
O trabalho como um todo deve ser entregue na data final (10/01/2020).

A modalidade de entrega toma a forma de um **arquivo `tar` comprimido (nome.tgz)** em que nome é o identificador do grupo.

O arquivo deve conter todos os ficheiros fontes necessários à compilação assim como um `Makefile` completo (as entradas `all` e `clean` devem estar presentes).

Este arquivo deverá igualmente conter o relatório que descreve o trabalho feito, as escolhas (de desenho, etc.) tomadas, a documentação do código e o manual do utilizador.

É igualmente esperado que seja preparada uma apresentação para a respectiva defesa.

## _Deadlines_

### 29/10/2019 — Exercício 1

Programar Natrix:
* **Programas de testes positivos**;
* **Programas de testes negativos**, devem incluir:
  * Erros sintaxe;
  * Erros de léxico;
  * Erros de tipagem;
  * Problemas de intervalo;
  * Etc.


### 19/11/2019 — Exercícios 2, 3, 4 e 5

Análise léxica, sintáctica e árvore de sintaxe abstracta:
* **Gramática**;
* **_Parsing_ e _Lexing_** — Os analisadores construídos deverão ter em conta uma gestão apropriada dos erros que possam surgir (por enquanto léxicos e sintácticos);
* **Árvore de sintaxe abstrata**;
* **_Parsing_ _Lexing_ (_bis_)** — Modificar os analisadores léxicos e sintácticos por forma a que seja construída uma árvore de sintaxe abstracta no caso de uma análise bem sucedida.


### 10/12/2019 — Exercícios 6, 7 e 8

Análise Semântica:
* **Semântica Operacional** — Defina uma semântica operacional para o subconjunto básico da linguagem Natrix(sem os tipos intervalo, por exemplo). É deixado a nosso critério a definição deste subconjunto. É no entanto necessário comunicar ao doente a escolha;
* **Semântica Operacional (opcional)** — Integre na semântica definida no exercício anterior o resto dalinguagem Natrix;
* **Interpretador**;


### Última Semana de Aulas — Exercício 9

Geração de Código:
* **Compilador** — o gerador de código para o maior núcleo possível da linguagem Natrix.


# Sintaxe

## Comentários
~~~
// isto é claramente um comentário em Natrix
~~~

## Constantes por Omissão na Linguagem

* `maxint` -> valor máximo de um inteiro
* `minint` -> valor mínimo de um inteiro


## Funções por Omissão na Linguagem
* `size(a)` — recebe um array `a` e devolve o um inteiro com o tamanho do array; 
* `print(v)` — imprime no ecrã a variável `v` (ver [Por Decidir](#por-decidir)).


## Definição de Intervalos
A palavra chave `type` intruduz a definição de tipos (com o respetivo nome)
~~~
type intervalo = [10 .. 20];
type i_max = [10 .. maxint];
~~~
Os intervalos só se aplicam a **valores positivos**.

## Arrays
Quando não é referido o intervalo num vetor, este é declarado como tamanho 10 e o intervalo do índice é de 0 a 9.  

São declarados da seguinte forma:

```
type <nome> : array <tamanho> of <tipo> filled by <valor inicial>`
```
Onde:
* **Tamanho** é um valor inteiro;
* **Valor inicial** é um valor do mesmo tipo atribuido ao vetor

### Exemplo
var a : array 10 of int filled by 1;


## Definição de Tipos

~~~
type arr = array i of i_max;
~~~

Deve ser decidido se o intervalo incluí ou excluí os valores de extremos.


## Variáveis
As variáveis da linguagem Natrix são mutáveis (_à la_ `C`), são explicitamente tipadas e necessariamente inicializadas.

~~~
var x : int = 5;

var y : i_max = 10;

var tab1 : arr filled by 0;

var tab2 : array 10 of int filled by 1;
~~~

Quando não é especificado o intervalo dos índices, deve ser lançado um erro.

No caso da linha 4, o `tab2` tem tamanho 10, sendo percorrido de 0 a 9.

### Arrays

~~~
type arr = array i of i_max;
~~~ 

### Atribuições e Expressões Numéricas
As  expressões são as mesmas que a linguagem `arith` (ficha prática 1), apenas que, neste caso, a função `size` devolve o tamanho dos intervalos e dos vetores.

~~~
x := x + size(30 .. 35) + size (tab1);

// potencial erro, caso o resultado esteja fora do intervalo i_max
tab[5] := let y = x + 3 in y * 5;

// instrução para mostrar valores numéricos
print (x + 1);
~~~


## Instrução condicional clássica `if`
As condições seguem as intruções padrões clássicos de = , != , < , <= , > , >= , & , | .  

~~~
if (x > 7) then { y:= y + 1; }
           else { y := y + 2; }
~~~


## Ciclos determinísticos

~~~
foreach i in 1..19 do { 
    x := x + i; 
    y = i * 2;
}
~~~

### Exemplos

~~~
type t = 0 .. 100;

type arr : array t of int;
var a : arr filled by 0;

var n1 : int = 1;
var n2 : int = 0;

a[0] := 0;
a[1] := 1;

foreach i in 2..100 do {
    a[i] := a[i-1] + a[i-2];
}

print(a[1000]);

var tmp : int = 0;

foreach i in t do {
    tmp := n1;
    n1 := n2 + n1;
    n2 := tmp;
}

print(n1);
~~~

# _Lexer_
Esta seção contém informação relevante ao _lexer_ da linguagem Natrix. Aqui serão apresentados todos os lexemas e palavras chaves da linguagem. 

## Expressões Regulares Auxiliares

Uma **letra** é definida como:
$$
letter = (a|b|c| ... |z|A|B|C|...|Z)
$$

Um **digíto** e definido da seguinte forma:
$$
digit = (0|1|...|9)
$$

Um **identificador** pode ser qualquer combinação de letra ou digíto, começando sempre por uma letra, sendo representado pela seguinte expressão regular:

$$
ident = letter.(letter | digit)^{*}
$$

Um inteiro é uma sequência digitos que deve conter pelo menos um número:

$$
  integer = digit^{+}
$$

Por fim, caracteres brancos serão espaços ou tabulações:

$$
  space = ( espaço | tab)
$$

## Palavras Chave

  _Input_ |  Palavras chave
:---------:|:---------- 
def       | DEF
if        | IF
then      | THEN
else      | ELSE
print     | PRINT
foreach   | FOR
in        | IN
do        | DO
type      | TYPE
var       | VAR
of        | OF
arry      | ARRAY
filled    | FILLED
by        | BY
let       | LET
size      | SIZE
true      | CONST(Cbool true)
false     | CONST(Cbool false)


## _Tokens_ 
Na seguinte tabela são listados todos os lexemas definidos.
  _Input_   |  Lexema
:----------:|:-----------------------|
  \n        | `new_line`
  \//       | `new_line`, próximo _token_
  EOF       | EOF
  ;         | SCOL
`space`     | next_token
`ident`     | palavra chave ou identificador
  (         | LP
  )         | RP
  [         | SLB
  ]         | SRB
  {         | LB
  }         | RB
  :         | COL
  :=        | SET
  =         | EQ
  ==        | CMP eq
  !=        | CMP neq
  <         | CMP lt
  >         | CMP gt
  <=        | CMP leq
  >=        | CMP geq
  &         | AND
  \|        | OR
  +         | PLUS
  -         | SUB
  *         | MUL
  /         | DIV
  ,         | COM
  ..        | RANGE

Caso seja lido um lexema não reconhecido na tabela em cima, será levantada uma exceção.

# Por Decidir
* Que tipos vamos inserir? Sugestão:
  * `bool`;
  * `char`;
  * `String`;
  * Nota: Como consequência, vamos também ter:
    * `array of bool`;
    * `array of char`;
    * `array of String`;
  
* O comportamento da função `print`? Possiveis soluções:
  * `print` tem o mesmo comportamento que a função `print` de Python;
  * Ou como em OCaml, com funções diferentes para cada tipo (e.g. `print_int`, `print_string`, etc.).

* Podemos definir funções? Se sim qual é a sintaxe?

* Operadores que podemos adicionar:
  * Concatenar strings;

* Qual o que acontece se executar-mos: `x := maxint + 1`;

* O intervalo `[100..0]` é válido?

* Definimos `let ... in ...` como:
  * `let x = e1 in e2`;
  * Ou `let x : (tipo) = e1 in e2`

# Referências
* https://caml.inria.fr/pub/docs/manual-ocaml/lexyacc.html;
* https://v1.realworldocaml.org/v1/en/html/parsing-with-ocamllex-and-menhir.html;
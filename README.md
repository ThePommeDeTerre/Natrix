# Natrix

## Entrega
O trabalho como um todo deve ser entregue na data final (10/01/2020).

A modalidade de entrega toma a forma de um **arquivo `tar` comprimido (nome.tgz)** em que nome é o identificador do grupo.

O arquivo deve conter todos os ficheiros fontes necessários à compilação assim como um `Makefile` completo (as entradas `all` e `clean` devem estar presentes).

Este arquivo deverá igualmente conter o relatório qued escreve o trabalho feito, as escolhas (de desenho, etc.)tomadas, a documentação do código e o manual do utilizador.

É igualmente esperada que seja preparada uma apresentação para a respectiva defesa.



## _Deadlines_

### 29/10/2019 - Exercício 1

Programar Natrix:
* **Programas de testes positivos**;
* **Programas de testes negativos**, devem incluir:
  * Erros sintaxe;
  * Erros de léxico;
  * Erros de tipagem;
  * Problemas de intervalo;
  * Etc.


### 19/11/2019 - Exercícios 2, 3, 4 e 5

Análise léxica, sintáctica e árvore de sintaxe abstracta:
* **Gramática**;
* **_Parsing_ e _Lexing_** - Os analisadores construídos deverão ter em conta uma gestão apropriada dos erros que possam surgir (por enquanto léxicos e sintácticos);
* **Árvore de sintaxe abstrata**;
* **_Parsing_ _Lexing_ (_bis_)** - Modificar os analisadores léxicos e sintácticos por forma a que seja construída uma árvore de sintaxe abstracta no caso de uma análise bem sucedida.


### 10/12/2019 - Exercícios 6, 7 e 8

Análise Semântica:
* **Semântica Operacional** - Defina uma semântica operacional para o subconjunto básico da linguagem Natrix(sem os tipos intervalo, por exemplo). É deixado a nosso critério a definição deste subconjunto. É no entanto necessário comunicar ao doente a escolha;
* **Semântica Operacional (opcional)** - Integre nasemântica definida no exercício anterior o resto dalinguagem Natrix;
* **Interpretador**;


### Última Semana de Aulas - Exercício 9

Geração de Código:
* **Compilador** - o gerador de código para o maior núcleopossível da linguagem Natrix.


## Sintaxe

### Comentários
~~~
// isto é claramente um comentário em Natrix
~~~

### Constantes por omissão na linguagem
~~~
maxint -> valor máximo de um inteiro
minint -> valor mínimo de um inteiro
~~~

### Definição de intervalos
~~~
type intervalo = [10 .. 20];
type i_max = [10 .. maxint];
~~~
Os intervalos só se aplicam a **valores positivos**.

### Arrays
~~~
type arr = array i of i_max;
~~~
Quando não é referido o intervalo num vetor, este é declarado como tamanho 10 e o intervalo do índice é de 0 a 9.  

### Variáveis
As variáveis da linguagem Natrix são mutáveis (_à la_ `C`), são explicitamente tipadas e necessariamente inicializadas.

~~~
var x : int = 5;

var y : i_max = 10;

var tab1 : array filled by 0;

var tab2 : array 10 of int filled by 1;
~~~

### Atribuições e Expressões Numéricas
As  expressões são as mesmas que a linguagem `arith` (ficha prática 1), apenas que, neste caso, a função `size` devolve o tamanho dos intervalos e dos vetores.

~~~
x := x + size(30 .. 35) + size (tab1);

tab[5] := let y = x + 3 in y * 5;
// potencial erro, caso o resultado esteja fora do intervalor i_max

print (x + 1);
// instrução para mostrar valores numéricos
~~~

* Instrução condicional clássica `if`
  ~~~
  if (x > 7) then { y:= y + 1; }
             else { y := y + 2; }
  ~~~
    As condições seguem as intruções padrões clássicos de = , != , < , <= , > , >= , & , | .  

* Ciclos determinísticos
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
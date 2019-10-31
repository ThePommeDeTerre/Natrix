# Natrix

## Entrega
O trabalho como um todo deve ser entregue na data final ().

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
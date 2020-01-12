# Natrix

## Como utilizar?
Para compilar o projeto apenas é necessário executar o seguinte comando no terminal:
~~~bash
make
~~~
Caso pretenda eliminar todos os ficheiro de *output*, utilize:
 ~~~bash
 make clean
 ~~~

 ## Como compilar um programa?
 Depois de o programa estar escrito e guardado em formato .nx, basta seguir os seguintes passos:

~~~bash
./natrix <ficheiro.nx>       # é gerado código em Assembly
gcc -no-pie -g <ficheiro.s>  # é gerado output
./a.out                      # execução do output 
~~~
Em alternativa, este conjunto de instruções pode ser executado num só comando:
~~~bash
./natrix <ficheiro.nx> && gcc -no-pie -g <ficheiro.s> &&./a.out
~~~

 ## Como interpretar um programa?
 Face a um ficheiro .nx é possível interpretá-lo executando o comando:

 ~~~bash
./natrix -i <ficheiro.nx>
 ~~~

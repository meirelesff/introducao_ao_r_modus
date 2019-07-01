# Este e' um comentario.


# No R, toda linha em um scrip iniciado por # e' um comentario.


# Isto significa que tudo o que vier depois de # nao sera' executado.


# Esta e' a primeira licao: crie comentarios em todo e qualquer codigo.
# - Eles ajudam a organizar o codigo;
# - Eles permitem comentar o que cada parte do codigo faz;
# - Eles facilitam a tarefa de replicar e publicizar um codigo.


# Sempre faca comentarios.


4 # Execute esta linha


# Quando executamos a linha acima, o console no R printa o numero quatro.
# (O resultado no console sempre vem acompanhado de [1] na frente; vamos
# ver isso melhor adiante). Podemos fazer o mesmo com outros numeros:
5
1


# E podemos fazer operacoes aritimeticas basicas tambem:
5 + 1


# O R calcula o resultado. Podemos testar com outros operacoes:
5 - 1

3 / 3 # / e' o operador de divisao

2 * 2 # * e' o operador de multiplicacao


# Podemos agora armazenar este ultimo resultado num objeto:
x <- 2 * 2


# Agora, se executarmos x (Ctrl + Enter ou digitando no console),
# o R exibe o resultado de 2 * 2:
x


# Esta e' a funcao principal de um objeto do R: armazenar informacoes na
# memoria. Especificamente, criamos um objeto atraves do operados <- 
# (sem espacos), como x <- 1, ou y <- 0. Basicamente, podemos ler isto 
# da seguinte forma: guarde o numero um em x; a seta, <-, apenas aponta
# para este x. Podemos usar estes objetos criados, posteriormente, 
# para realizar tarefas mais complexas:
x * 2


# O codigo acima e' o equivalente de 4 * 2 (lembre-se de que salvamos
# o resultado de 2 * 2 no objeto x). Podemos fazer coisas ainda mais
# complexas:
x * x

x^2 # ^ e' o operador de exponenciacao


# Existem varios outros operadores:
3 %% 2 # resto
3 %/% 2 # divisao sem resto


# Tambem podemos visualizar o conteudo do objeto x por meio da funcao
# print:
print(x)


# No R, tudo o que vier acompanhado de () sao funcoes (como funcoes na
# matematica, que tomam um ou mais numeros, fazem algumas operacoes
# nele e retornam outro, ou outros, numero).


# Tambem podemos armazenar palavras (no R, as chamamos de strings) no R:
x <- 10
y <- "Exemplo 2"


# Agora, se abrirmos x, ele retornara':
x


# Podemos fazer o mesmo com print:
print(y)
y


# Mas nao podemos somar ou subtrair uma palavra, apenas numeros:
2 + "palavra"


# Esta e' a segunda grande licao: a maioria dos erros no R sao 
# gerados por tentativas de realizar operacoes com informacoes de
# tipos diferentes (veremos mais tipos e classes adiante).


# Quando erros ocorrem, especialmente com funcoes, a melhor coisa
# a se fazer e' pedir ajuda. No R, isto significa, primeiramente,
# olhar a documentacao com a funcao help. Por exemplo:
help(print)


# Com esse codigo, pedimos ajuda sobre o funcionamento da funcao
# print, introduzida anteriormente, o que abre a pagina de help
# desta funcao. Tambem podemos abrir outras paginas de help, como
# a sobre os operadores aritimeticos (precisam estar entre aspas):
help("+")


# Continuando, tambem podemos criar vetores com mais de um numero
# (ou outros elementos, como strings) no R. Por exemplo, este
# codigo cria uma sequencia numerica de 1 a 10:
1:10


# E este, de 10 a 1:
30:1


# Podemos criar a mesma sequencia desta forma:
x <- c(10, -10, 5, 300, -2.4, 3, 99)


# No caso, a funcao c() (combine) diz ao R que queremos que
# as informacoes introduzidas, separadas por virgula, devem
# ser armazenadas conjuntamente, num vetor. Podemos tambem
# criar vetores com palavras:
c("Uma", "frase")


# Que podem ser salvos em objetos na memoria:
x <- c(1, 2, 3, 4)
print(x)


# Se quisermos saber quantos elementos tem um vetor, basta
# usarmos a funcao lenght:
length(x) # Para obter mais informacoes, digite help(length)


# Se criamos um vetor muito grande, o [1] que aparece no console
# sera acompanhado de outros numeros entre colchetes:
1:100


# Como da pra ver, eles representam quantos elementos tem um vetor.
# No caso, cada numero entre colchetes indica o numero do primeiro
# elemento dentro do vetor.


# Com isso, podemos acessar um elemento especifico do vetor usando colchetes:
z <- 1:10
z[1] # acessa o primeiro elemento de z
z[5] # acessa o quinto elemento de z
z[10] - 1 # subtrai 1 do decimo elemento de z


# Se quisermos trabalhar com o vetor recem criado, podemos
# simplesmente usa-lo para realizar operacoes aritimeticas. O
# seguinte codigo subtrai 1 de cada elemento do vetor x:
x <- 1:10
x - 1


# Por fim, o R tambem pode testar equivalencias e diferencas. Por exemplo:
2 == 2


# No caso, usamos o operador == (le-se e' igual que), que testa se a informacao,
# de um lado do operador e' igual a do outro lado. Usamos ele tambem para testar
# equivalencia entre strings:
"palavra" == "palavra"
"palavra" == "palavras"


# Outras formas de testar equivalencia, para informacoes do tipo numeric, incluem:
# - maior que >
# - menor que <
# - maior ou igual que >=
# - menor ou igual que <=
# - e diferente de !=
3 > 2
1 != 0
1 >= 1
5 <= 3
1 < 6


# Tambem podemos comparar informacoes ja' armazenadas em objetos:
cafe_puro <- 9999999
cafe_doce <- 0.9999999
cafe_puro > cafe_doce


# Com isso, terminamos a parte de familiarizacao com o console no R.
# Cobrimos muita coisa ja', e tenho certeza que algumas coisas nao ficarao claras agora.
# Aproveitando, sempre que tiver duvidas sobre uma funcao ou operador, use a funcao 'help':
help(sum)
help("%/%")


# No arquivo 1_exemplos_basicos.R, na pasta de scripts adicionais, estao disponiveis 
# alguns exemplos de codigos comentados, que podem ser usados para praticar o que
# foi visto ate' aqui.


# ------------------------------------------------------------------------------


# Muitas vezes, queremos usar codigo feito por outra pessoa que esta' em um pacote --
# o que nada mais e' que um amontoado de codigo com utilidades diversas. Instalamos
# um pacote com 'install.packages'. 


# Neste curso, usaremos muito o 'tidyverse'. Vamos instala-lo:
install.packages("tidyverse")


# Feito isso, podemos carrega-lo com:
library(tidyverse)


# Pronto, podemos usar suas funcoes. Para ter uma idea, elas sao mais de 300,
# incluindo desde de manipulacao de qualquer tipo de dado, navegacao na internet
# via httr ate' producao de graficos.


# Alem disso, o tidyverse vem com alguns bancos de dados (data.frames ou tibbles),
# que sao uteis para nos familiarizarmos com esse tipo de formato.


# Particularmente, o tidyverse tem um banco (salvo em um objeto) chamado band_members.
# Vamos tentar abri-lo.
band_members


# Ok, podemos fazer melhor.
View(band_members)


# Essa funcao, View, nao faz parte do tidyverse, mas e' util para visualizar dados
# como em uma planilha.

# Ou melhor ainda, pra ser rapido e sintetico:
glimpse(band_members)


# 











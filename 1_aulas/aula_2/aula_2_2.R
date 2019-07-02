# ---
# INTRODUCAO AO R - Aula 2.2
# ---


# ---
# Instrutor: 
#
# Fernando Meireles
# www.fmeireles.com
# ---


# Ate' agora, vimos como abrir a maioria dos tipos de arquivo usados para armazenar dados e como manipular
# de forma simples bancos de dados (data.frames). Daqui para a frente, veremos como usar o pacote dplyr,
# para manipular data.frames de forma mais avancada. Especificamente, aprenderemos
# a usar as quatro principais operacoes, ou verbos, para manipular dados no R, quais sejam:

# 1) Fatiar (filter e slice, operacoes horizontais)
# 2) Selecionar (select, operacoes verticais)
# 3) Modificar (mutate e summarise, para criar e modificar variaveis e observacoes)


# Tendo este conteudo dominado, saberemos como realizar uns 90% de todas as tarefas mais comuns
# numa analise de dados (na verdade, precisaremos saber agrupar dados, mas isso cobriremos
# na proxima aula).


# Para comecar, vamos carregar o tidyverse
library(tidyverse)


# Tambem vamos precisar de alguns dados. Aqui, usaremos alguns meta-dados de um periodico hospedado no Scielo.
# Os dados estao no arquivo 'base_scielo.txt', e podem ser carregados
# com read_delim (o separador e' ponto e virgula):

dados <- read_delim("base_scielo.txt", delim = ";")
glimpse(dados) # para entendermos os dados


# Vamos comecar pelas operacoes de fatiamento dos dados. O tidyver oferece duas principais
# funcoes para realizar este tipo de operacao: filter() e slice(). A primeira filtra observacoes de 
# um banco de acordo com um criterio (ex., ficar apenas com observacoes onde o valor da variavel x e' maior que 10);
# ja' a segunda funcao, slice, nos permite selecionar observacoes pela ordem (ex., ficar apenas com as 10 primeiras).


# O codigo abaixo filtra os artigos pelo numero de paginas, ficando apenas com aqueles com menos de 10 paginas:
nrow(dados) # a base tem 288 observacoes
dados <- filter(dados, n_pages < 10) # fica apenas com artigos com menos de 10 paginas
nrow(dados) # a base agora tem 280 observacoes


# O jeito como a funcao filter funciona e' bastante simples. Primeiro, passamos a base que queremos
# filtrar como primeiro argumento da funcao (no caso, 'dados'); depois, colocamos a condicao que queremos
# testar. Todas as observacoes que atendam a condicao (TRUE) ficam na base; as que nao antendem, sao descartadas.
# Vamos ver outros exemplos:

dados <- filter(dados, n_pages > 3 & n_pages < 9) # fica com artigos com mais de 3 paginas e menos de 9
dados <- filter(dados, n_authors < 10 | n_pages >= 4) # fica com artigos com menos de 10 autores
                                                      # ou com mais de 5 paginas

dados <- filter(dados, year == 2004) # fica apenas com artigos publicado em 2004
dados <- filter(dados, n_authors != 2) # fica apenas com artigos com qualquer numero de autores/as, menos 2
nrow(dados) # ficamos agora com apenas 41 observacoes


# slice() funciona de um jeito mais simples: precisamos especificar a posicao das linhas que queremos manter.
# Vamos carregar novamente os dados para usar a funcao.
dados <- read_delim("base_scielo.txt", delim = ";")
dados <- slice(dados, 1:100) # fica apenas com as 100 primeiras observacoes
dados <- slice(dados, c(1, 5, 10)) # agora, fica apenas com a 1, a 5 e a 10 observacao do que sobrou


# Note que podemos usar a funcao filter para especificarmos a negacao de uma condicao. Basta usar
# o operador ! na frente da condicao (! nega tudo o que vem depois).

TRUE # verdadeiro
!TRUE # inverso de verdadeiro, FALSE

dados <- read_delim("base_scielo.txt", delim = ";")
dados <- filter(dados, n_pages < 10) # fica apenas com artigos com 10 ou mais paginas (o inverso da operacao)

# Isto (o operador !) tambem e' util para removermos NA (missings) de uma base. Para isto, usamos
# a funcao is.na(), que serve para indicar se um valor e' ou nao NA, em conjunto com filter. Exemplo.

is.na(2) # Nao e' NA
is.na(NA) # E' NA
dados <- filter(dados, !is.na(n_pages)) # Fica apenas com observacoes sem NA na variavel n_pages


# Agora que sabemos filtrar observacoes, podemos remover missings, ou recortar uma base da forma que quisermos.
# Podemos agora aprender o mesmo com variaveis: como selecionar, ou remover, algumas variaveis de uma base.
# Para esta operacao, usamos a funcao select(). E podemos fazer isto de duas maneiras:

dados <- dados <- read_delim("base_scielo.txt", delim = ";")
dados <- select(dados, c(1, 2, 3, 4)) # fica apenas com as quatro primeiras variaveis



# Podemos excluir uma variavel usando o operador - na frente:
dados <- select(dados, -3) # remove a terceira variavel do banco


# Estas operacoes sao mais ou menos o mesmo que fazer isto:
dados <- read.table("base_scielo.txt", stringsAsFactors = F)
dados <- dados[, c(1, 2, 4)]


# Mas a funcao select nos permite fazer isto de um jeito mais util: com o nome da variavel.
# Por exemplo, digamos que queremos apenas a variavel author e year da base:
dados <- read_delim("base_scielo.txt", delim = ";")
dados <- select(dados, author, year)


# Ou que, agora, queremos excluir a variavel year
dados <- select(dados, -year)


# (Caso tenha esquecido, podemos saber o nome das nossas variaveis com a funcao names):
names(dados)


# Enfim, combinando estes dois simples verbos, de operacoes verticais e horizontais, 
# podemos limpar qualquer base de dados (removendo missings ou variaveis) de uma base.
# Por exemplo, vamos dizer que eu queira analisar apenas artigos com mais de 1 autor,
# e que, alem disso, eu precise apenas da variavel year e n_pages do banco.
dados <- read_delim("base_scielo.txt", delim = ";")
dados <- filter(dados, n_authors > 1)
dados <- select(dados, year, n_pages)


# Podemos passar agora para os dois ultimos verbos, que servem para criar e modificar observacoes
# e variaveis. Estas funcoes sao: mutate e summarise. Vamos comecar pela primeira.


# Para exemplificar o primeiro verbo, vamos criar uma nova variavel no banco de artigos que e' igual
# a soma das variaveis n_pages e n_authors:
dados <- read_delim("base_scielo.txt", delim = ";")
dados <- mutate(dados, nova_variavel = log(n_pages),
                nova_variavel2 = 1)


# Como da' para ver, a funcao e' tao simples como as anteriores. E podemos criar mais de uma variavel
# por vez:
dados <- mutate(dados, var1 = log(n_pages), var2 = sqrt(n_pages)) # log e raiz quadrada de n_pages


# E, o que e' bastante util, podemos substituir uma variavel. Neste caso, vamos adicionar 1 a
# todos as observacoes da variavel n_pages
dados <- mutate(dados, n_pages = n_pages + 1) # adiciona 1 a variavel n_pages


# Do mesmo jeito, podemos agora centrar a variavel n_pages (subtrair a media da variavel de cada observacao)
dados <- mutate(dados, n_pages = n_pages - mean(n_pages))


# Outro uso importante da funcao mutate e' o de alterar apenas alguns valores de uma variavel. 
# Imagine que queiramos substituir todos os valores de n_pages que forem maiores que 1 por 99.
# Neste caso, fariamos:
dados <- mutate(dados, n_pages = ifelse(n_pages > 1, 99, n_pages))


# Por fim, imagine que, em vez de criar uma nova variavel, quero resumir todas as informacoes
# de uma: por exemplo, saber sua media, seu desvio padrao, algo do tipo. summarise oferece
# uma forma simples de fazer isso:
dados <- read_delim("base_scielo.txt", delim = ";")
summarise(dados, media_n_paginas = mean(n_pages))


# Podemos, assim como fizemos com mutate, usar mais de uma variavel ao mesmo tempo:
summarise(dados, media_n_paginas = mean(n_pages), 
          media_n_autores = mean(n_authors))


# OU, ainda, podemos criar mini descricoes de uma variavel
summarise(dados, 
          media_n_paginas = mean(n_pages),
          mediana_n_paginas = median(n_pages),
          desvio_n_autores = sd(n_authors),
          total_autores = sum(n_authors))






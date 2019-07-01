# ---
# 0 EXEMPLO DE ANALISE DE DADOS ELEITORAIS
# ---


# Cria o checkpoint
if(!require(checkpoint)) install.packages("checkpoint")
checkpoint::checkpoint("2019-01-01")


# Pacotes necessarios
library(tidyverse)
library(here)
library(rio)


# Carrega os dados (com resultados do PT nas eleicoes presidenciais nos municipios brasileiros e 
# alcance do Programa Bolsa Familia, alem de outras variaveis; o banco esta' na pasta 'dados).
# Eles fazem parte de um artigo que investiga o efeito do PBF no desempenho eleitoral do PT em 
# eleicoes presidenciais, publicado na AJPS por Zucco (2013).
bf <- import(here("dados", "bolsafamiliadataset.dta"))


# Como o banco vem com variaveis de diferentes anos nas mesmas observacoes, vamos selecionar
# apenas variaveis de 2010, incluindo alcance do PBF e proporcao de votos da Dilma no primeiro
# turno de 2010.
bf <- select(bf, codeibge, state, alcance_2010, gini_2000, hdi_2000, nonwhite_2010, pib_2009,
             pop_2010, dilma_vs_2010)


# Tambem vamos transformar algumas variaveis. Como e' possivel imaginar, variaveis como pop_2010
# populacao do municipio em 2010) e pib_2010 (pib bruto) tem certa concentracao. Podemos 
# tranformar elas em logaritmo.
bf <- mutate(bf, pop_2010_log = log(pop_2010), pib_2009_log = log(pib_2009))



# Tabem vamos nos certificar de que todas as variaveis estao com classes corretas (numeros como
# numeric e categorias como character). Rode os comandos abaixo apenas para se certificar.
# glimpse(bf) 
# apply(bf, 2, class) # Faz a mesma coisa, mas nao teremos tempo de ver isso em detalhes


# Como e' possivel ver, todas as variaveis estao como numeric, mas sabemos que codeigbe (codigo do
# municipio no IBGE) e state (codigo do estado) sao categoricas.
bf <- mutate(bf, codeibge = as.character(codeibge), state = as.character(state))


# Pronto, com isso temos um banco limpo para analise (o banco ja' vem, por padrao, com poucas
# coisas a fazer, o que nem sempre e' o caso). Podemos, agora, salvar esta versa limpa do 
# banco para fazer analises. Vamos usar a funcao save.
save(bf, file = here("dados", "pbf_2010_limpo.Rda"))


# Apagamos os objetos da memoria antes de sair, e continuamos a analise no proximo script.
rm(list = ls())

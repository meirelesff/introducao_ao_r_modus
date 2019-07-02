# ---
# INTRODUCAO AO R - Aula 2.1
# ---


# ---
# Instrutor: 
#
# Fernando Meireles
# www.fmeireles.com
# ---


# Na aula passada, cobrimos o basico do R: objetos, classes, vetores e data.frames. Nesta,
# aprenderemos a carregar dados para o R a partir de diversos tipos de formatos (na verdade,
# de dezenas deles, usando apenas ferramentas bastante simples). 

# Nesta aula, veremos como o serve R para abrir qualquer dado (literalmente, embora tenhamos
# que implementar solucoes proprias em alguns casos - as famosas gambiarras).

# Tambem usaremos alguns pacotes, que nada mais sao do que conjuntos de funcoes criadas por
# alguem e que estao disponiveis para download. O procedimento e' simples: instalamos um pacote,
# carregamos ele e, entao, passamos a usar as suas funcoes. Nesta aula, precisaremos instalar:
install.packages("readxl") 
install.packages("haven")
install.packages("rio")


# Como na aula anterior, tambem precisaremos carregar esses pacotes. Usamos 'library':
library(tidyverse)
library(readxl)
library(haven)
library(rio)


# Como da' para ver na pasta destes scripts, temos varios arquivos chamados 'municipios_mg.XXX', cada
# um deles com uma extensao diferente. Estes contem dados (banco de dados, ou planilha) com informacoes
# sobre as despesas orcamentarias de 808 municipios mineiros em 2012, retirados do website do 
# Tesouro Nacional (Finbra). Especificamente, temos:

#- Uma versao do arquivo em .csv;
#- Uma versao do arquivo em .txt;
#- Uma versao do arquivo em .xlsx (Excel);
#- Uma versao do arquivo em .dta (Stata);
#- Uma versao do arquivo em .sav (SPSS);
#- E uma versao do arquivo em .Rda (formato nativo do R).

# Iremos aprender a carregar cada um deles, usando, para isto, alguns dos pacotes que instalamos.
# Apesar de parecer muita coisa, o procedimento e' simples: basta usar uma funcao.

# Vamos comecar pelos tipos mais simples: os delimitados por caracteres. 

# Le um arquivo .txt separado por TAB (tres em espaco):
banco <- read_delim("municipios_mg.txt", delim = "   ")


# Se o arquivo for separado por outro caractere (;, ex.)
banco2 <- read_delim("municipios_mg2.txt", delim = ";") 


# O tipo de arquivo mais comum para salvar dados, entretanto, e' .csv
banco3 <- read_csv("municipios_mg.csv")


# Para carregarmos arquivos de SPSS ou de Stata, precisamos usar o pacote 'haven', que instalamos
# anteriormente.
banco4 <- import("municipios_mg.sav")


# Para carregarmos um arquivo do Stata, usamos:
banco5 <- import("municipios_mg.dta")


# Detalhe importante: o R possui funcoes nativas para carregar .dta e .sav, que estao no pacote
# 'foreign' (as funcoes sao read.dta e read.spss, respectivamente). Entretanto, import usa um
# sistema inteligente de reconhecimento dos arquivos, o que evita termos de especificar argumentos
# adicionais na funcao; alem disso, ele preserva labels das variaveis.


# No R, entretanto, a forma mais eficiente de armazenar e carregar dados e'
# usando as funcoes save() e load(). Isto cria um arquivo no formato .Rda (Rdata),
# que economiza mais espaco. Vamos apagar todas as bases que carregamos, criar outra,
# salva-la com save() e depois carrega-la com load():

rm(list = ls()) # apaga tudo na memoria

banco <- data.frame(x = 1:100, y = 100:1) # cria um data.frame com duas variaveis com
                                                    # 100 observacoes cada uma

save(banco, file = "meu_banco.Rda")


rm(banco) # apaga banco da memoria


load("meu_banco.Rda") # carrega banco novamente na memoria


# Vamos, agora, carregar os dados dos municipios mineiros em .Rda (mesmo procedimento):
load("municipios_mg.Rda")


# Isto aprendido, vamos agora carregar um tipoe de arquivo bastante comum: .xlsx, do Excel.
# Para tanto, precisamos carregar o pacote 'readxl'.


# E, para carregar um .xls, precisamos passar seu nome e endereco, alem de indicar em
# qual planilha ele esta' (sheet 1, sheet 2, etc.). Fazemos assim: 
banco <- read_excel("municipios_mg.xlsx", sheet = 1)


# Por fim, se estiver com duvida de como carregar um arquivo (mesmo os que nao vimos aqui),
# instale e use o pacote 'rio'


# Com ele carregado, basta passar o nome do arquivo que se quer carregar para a funcao import().
# Alem disso, ele nos permite exportar dados facilmente para qualquer formato com a funcao export().
# Alguns exemplos:

export(banco, file = "banco_mg1.csv") # Exporta nosso banco para .csv
export(banco, file = "banco_mg2.txt") # Exporta nosso banco para .txt
export(banco, file = "banco_mg1.dta") # Exporta nosso banco para .dta
export(banco, file = "banco_mg1.Rda") # Exporta nosso banco para .Rda

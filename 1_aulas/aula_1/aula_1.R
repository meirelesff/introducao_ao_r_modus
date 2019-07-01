# ---
# INTRODUCAO AO R - Aula 1
# ---


# ---
# Instrutor: 
#             
# Fernando Meireles  
# www.fmeireles.com
# ---


### CONVENCOES NO R

# Criar um novo objeto com o operador '<-'
x <- 1
y <- 2


# Mas perceba que, se nao colocarmos nada depois de '<-', o R retornara um erro
x <- 1


# Remove x e y da memoria (?rm para acessar a documentacao)
rm(x)


# Na nomeacao de objetos e' preciso evitar:
# - Nomes iguais ao de uma funcao: e.g. rm <- 1
# - Nomes que comecam por numero: 1x <- 1
# - Nomes que comecam com caracteres especiais: _a <- 1 ou .1 <- 1
# - Nomes com espaco: meu objeto <- 1
# - Tambem e' boa pratica nao usar letras maiusculas porque o R
# e' case sensitive.


### ESTILO

# Para manter a legibilidade do codigo, e' sempre bom usar espacos
# entre argumentos, objetos e parametros. Exemplo:

x<-1 # Ruim
x <- 1 # Bom

2*1+4+2 # Ruim
2 * 1 + 4 + 2 # Bom

x+x+sum(x,x,na.rm=TRUE) # Ruim
x + x + sum(x, x, na.rm = TRUE) # Bom


# Tambem e' bom usar _ para espacar nomes dos objetos
meuobjeto <- 1 # Ruim
meu_objeto <- 1 # Bom


# E evitar acentos e caracters especiais, mesmo nos comentarios (porque pode abrir de 
# forma errada em outros computadores):

ação <- 1 # Ruim
acao <- 1 # bom


# Por fim, uma boa pratica e' sempre pular uma linha entre codigos diferentes,
# do mesmo modo como este codigo esta organizado: cada bloco de codigo esta
# separado por dois espacos. Por exemplo:

x <- 2
y <- 3

print("Exemplo de texto nao relacionado com x e y.")


### TIPOS

# O R tem dois tipos basicos de objetos principais:
# - numeric, para armazenar numeros; e
# - character, para armazenar caracteres e strings.


## O tipo numeric

# Podemos criar um vetor numerico de um a 100
vec <- 1:100


# Podemos criar vetores com casas decimais:
vec <- c(0.1, 3.5, 2.556, 5.1)


# E, com um vetor criado, podemos acessar apenas um ou mais elementos dele com []:
vec[1] # acessa o primeiro elemento do vetor 'vec'
vec[3] # acessa o segundo elemento do vetor 'vec'
vec[1] + vec[3] # soma o primeiro e o segundo elementos de 'vec'


# E usamos a funcao is.numeric() para verificarmos se um objeto
# e' numeric:
is.numeric("texto")

# A funcao retorna TRUE, que e' um outro tipo basico que nao vamos abordar
# agora. Basicamente, TRUE equivale a verdadeiro (o R testa uma afirmacao)
# e FALSE para negativo. 


# ---
# EXERCICIOS I
# ---


# Com objetos numericos, podemos fazer qualquer operacao matematica ou estatistica.
# Podemos calcular a media do vetor:
mean(vec)


# Podemos calcular o desvio
sd(vec)


# podemos calcular o maximo e o minimo
max(vec)
min(vec)


# E com tudo isso podemos documentar as estatisticas descritivas de uma
# variavel (algo comuns em artigos que usam dados quantitativos):
media <- mean(vec)
desvio <- sd(vec)
maximo <- max(vec)
minimo <- min(vec)

x <- c(media, desvio, maximo, minimo)
x


# O R tambem tem uma funcao que gera uma serie de estatisticas descritivas
# de uma variavel: a funcao summary
summary(vec)


# E tambem uma funcao, hist, que nos permite visualizar uma distribuicao
# (mais informacoes no arquivo histogramas.R):
hist(vec)


# O R tambem tem uma serie de funcoes para calcular outras coisas, como
# uma correlacao de Pearson:

cor(vec, vec) # como da pra ver, a correlacao entre vec e vec e' perfeita


# Tambem podemos gerar vetores numericos aleatorios de acordo com uma distribuicao.
# A funcao rnorm, por exemplo, cria uma distribuicao normal:

x <- rnorm(1000, mean = 0, sd = 1) # Cria um vetor numerico com 1000 elementos, media 0 e sd 1

mean(x)
sd(x)


# Podemos visualizar esta distribuicao com
hist(x)


# Criamos outra distribuicao
y <- rnorm(1000, mean = 0, sd = 5) # Cria um vetor numerico com 1000 elementos, media 0 e sd 5


# Calcula a correlacao de Pearson entre as duas
cor(x, y)


# Podemos, por fim, rodar uma regressao linear, para ver se a variacao em x explica
# a variacao em y

lm(y ~ x) # o simbolo ~ significa formula, onde tudo que vem apos ele e' variavel explicativa


# Podemos obter um resumo mais completo dos resultados com a funcao summary
modelo <- lm(y ~ x)
summary(modelo)


# Isto feito, podemos usar a funcao plot para plotar x e y com a linha da regressao
# (mais informacoes sobre scatterplot no arquivo scatterplots.R)
plot(x, y)
abline(modelo)


## O tipo character

# O R tambem possui um outro tipo basico util para analises: o character.
# Basicamente, ele serve para armazenar caracteres e strings. Exemplo:
x <- "exemplo"
x


# Da mesma forma que com informacoes do tipo numeric, podemos criar vetores com
# strings:
x <- c("Meu", "exemplo", "de", "vetor")
x


# E, se quisermos, podemos unir todos os elementos de um vetor de caracteres
# com a funcao paste:
paste(x, collapse = " ")

x <- paste(x) # paste(x) sobrescreve o conteudo anterior de x
x


# Com a funcao is.character, e' possivel testar se um objeto e' character:
is.character(x)


# Mas a principal utilidade estatistica deste tipo e' usalo como variaveis categoricas.
# Por exemplo, podemos ter uma varivavel que indica o partido de alguns candidatos/as:
filiacao <- c("PT", "PMDB", "PT", "PFL", "PSDB", "PSDB", "PMDB")
filiacao


# Neste caso, vemos que o elemento um do vetor e' do PT, o segundo do PMDB e assim por diante.
# Podemos contar quantos partidos diferentes tem filiados com a funcao unique:
unique(filiacao)


# Também podemos salvar o output da funcao unique como um novo vetor:
partidos_unicos <- unique(filiacao)
partidos_unicos[1] # acessa o conteudo do primeiro elemento do novo vetor


# E podemos criar uma tabela de frequencia por meio da funcao table:
table(filiacao)


# Tambem podemos alterar alguma informacao dentro do vetor (mudar a sigla do partido, por exemplo):
filiacao[filiacao == "PFL"] <- "DEM"


# E vemos o resultado com unique:
unique(filiacao)


# Ou com table:
table(filiacao)


# Normalmente, characters sao mais versateis em analises de texto (que nao abordaremos neste curso),
# e em data.frames, que veremos adiante.


# É importante notar que o R permite criar vetores com diferentes classes 
# (numeric, integer [numeros inteiros], logical, character, complex). Exemplo:

a <- c(2, "Texto")   ## R converte tudo para character
a

a <- c(TRUE, 3)    ## R converte tudo para numeric (TRUE vira 1, FALSE vira 0)
a

a <- c("Texto", TRUE)  ## R converte tudo para character
a

a <- c(1.3, 2) ## R converte tudo para numeric, que sao numeros com casas decimais
a


# Para saber qual e' a classe de um objeto, use a funcao class():
a <- c("Texto")
class(a) # character

a <- c(1.2, 2, 3.1)
class(a) # numeric

a <- c(T, F)
class(a) # logical


# Podemos usar algumas funcoes para forcar a conversao de uma classe a outra.
# (O que e' util quando queremos transformar alguma variavel):

as.numeric(TRUE) # Transforma TRUE (que e' logical) para numeric
as.character(1.2) # Transforma 1.2 em character


# Mas isso nem sempre funciona. Se tentarmos converter texto para numeros, por
# exemplo, o R nao sabera o que fazer (a operacao nao faz sentido) e retornara
# um aviso.
as.numeric("Meu texto")


# O resultado e' NA, que e' o missing do R (geralmente em bases de dados, missing
# e' 99, 999 ou algo do tipo). Note-se, também, que NA nao e' nem character, nem
# numeric e nem logical: NA e' uma classe propria.

is.numeric(NA) # NA nao e' numerico
is.character(NA) # NA nao e' texto
is.na(NA) # NA e' NA, so' isso


# A maioria das funcoes de analise de dados do R, como a de regressao linar (lm),
# por padrao descartam observacoes com NA antes de rodar um modelo.


# Mas, as vezes, queremos transformar os missings que temos numa base em outra
# coisa. Nestes casos, podemos fazer algo como (veremos como fazer isso de 
# forma mais facil adiante):
x <- c(NA, 1, 4, 6)
ifelse(is.na(x), 10, x)


# Como da' pra ver, usamos a funcao ifelse, que testa se a uma condicao (se algum
# dos elementos de x e' NA, no caso) e transforma os valores que atendem essa condicao.
# No caso, mudamos os NA para 10.


# ---
# EXERCICIOS II
# ---


# Por fim, podemos reunir tudo o que aprendemos para trabalhar com bancos de dados.
# Para isto, nao e' necessario muita coisa: usamos vetores, que em bancos sao variaveis,
# e sabemos acessar cada um de seus elementos, as linhas. Combinamos isso da seguinte forma:

var1 <- 1:10
var2 <- 10:1

banco <- data.frame(var1 = var1, var2 = var2)


# O codigo acima, deste modo, criara' um data.frame (o nome pomposo para bancos de
# dados no R). Podemos visualizar seu conteudo como um objeto normal.
banco


# Ou usar a funcao View() para abri-lo como uma planilha:

View(banco) # Basta passar o nome do banco que queremos visualizar


# Podemos acessar variaveis de um banco como acessamos elementos de um vetor.
# A unica diferenca e' que, como bancos sao bidimensionais (variaveis e linhas),
# teremos que usar dois indexadores. O codigo abaixo, por exemplo, acessa a primeira
# observacao da segunda variavel do banco.
banco[1, 2]


# Outros exemplos:

banco[1, 1] # Primeira observacao da primeira coluna

banco[10, 1] # Decima observacao da primeira coluna

banco[3, 2] # Terceira observacao da segunda coluna

banco[1, ] # Primeira observacao de todas as colunas (basta deixar em branco o espaco depois da virgula)

banco[, 1] # Todas as observacoes da primeira coluna


# Outra vantagem do data.frame e' que, com ele, ganhamos um novo operador:
# o cifrão. Com ele, basta digitar o nome do banco, adicionar $, e digitar
# o nome da variavel para acessa'-la. Por exemplo:
banco$var1

# Ou
banco$var2


# (Note que o RStudio ja' completa o nome da variavel). Podemos, com isso,
# acessar elementos especificos de uma variavel:

banco$var1[1] # Primeiro elemento da variavel var1

banco$var1[c(1, 3, 5)] # Primeiro, terceiro e quinto elementos de var1


# Podemos tambem modificar uma variavel inteira. Por exemplo, vamos 
# adicionar um a todos os elementos de var1:

banco$var1 # Variavel com seus valores originais

banco$var1 <- banco$var1 + 1 # Adicionamos um a todos os valores


banco$var1 # Os valores foram alterados


# Usando esta ideia, podemos fazer transformacoes de variaveis que sao uteis
# numa analise. Por exemplo, podemos aplicar o log numa variavel:

banco$var2 <- log(banco$var2) # Tranforma var2 em logaritimo
banco$var2


# E, por fim, usando o mesmo cifrão ($), podemos criar diretamente uma variavel:

banco$var3 <- banco$var1 + banco$var2 # Cria var3, que e' igual a soma das variaveis var1 e var2


# Na proxima aula, veremos detalhadamente como trabalhar com banco de dados, e isto
# de uma forma muito mais simples e potente. Por enquanto, tente praticar o que foi
# visto. Caso precise, nao exite de voltar neste codigo, repetir e adaptar os exemplos.


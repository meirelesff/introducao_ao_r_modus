# Primeiro, vamos criar tres variaveis para estes exercicios

x <- rnorm(100) # cria uma variavel com distribuicao normal, media 0 e 100 observacoes
y <- rnorm(100) # cria uma variavel com distribuicao normal, media 0 e 100 observacoes
binom <- rbinom(100, 1, 0.5) # cria uma variavel binaria (1 e 0) com 100 observacoes


# Teste t, de diferenca de medias
t.test(x, y)


# Teste t pareado
t.test(x, y, paired = TRUE)


# Teste t com uma amostra
t.test(x, mu = 3) # 'mu' e' a media real na populacao


# Modelo linear bivariado
lm(y ~ x)


# Modelo multivariado (com uma dummy)
lm(y ~ x + binom)


# Modelo multivariado (com efeitos fixos)
lm(y ~ x + as.factor(binom) - 1)


# Modelo linear com termo quadratico (ou cubico)
lm(y ~ x + I(x^2)) # I() serve para realizar a operacao aritmetica antes de rodar o modelo (evita erros)
lm(y ~ x + I(x^2) + I(x^3))


# Modelo linear com termo multiplicativo
lm(y ~ x*binom)


# Modelo logistico
glm(binom ~ x, family = "binomial")


# Modelo linear com dados de um data.frame (mesmo vale para outros modelos)
banco <- data.frame(x = rnorm(100), y = rnorm(100))

resultado <- lm(y ~ x, data = banco)

summary(resultado)


# Visualiza o resultado numa tabela (com o pacote stargazer)
library(stargazer)

stargazer(resultado, type = "html", out = "tabela_regressao.html")


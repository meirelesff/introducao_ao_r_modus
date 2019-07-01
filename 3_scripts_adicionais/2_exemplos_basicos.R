# Armazena valores numericos em dois objetos (x e y) e depois soma os dois
x <- 2
y <- 2
x + y


# Divide um numero pelo outro
10 / 2


# Divide um numero pelo outro e, depois, divide o resultado da divisao por
# outro numero:
10 / 2 / 5


# Realiza uma operacao mais complexa (use parentesis para fazer o R executar
# algo primeiro porque o resultado pode mudar):
(1 + 2) / (5 + 2)
1 + 2 / 5 + 2


# Exponencia um numero
2^2
x <- 2
x^2
x^2


# Raiz quadrada de um numero (com a funcao sqrt)
sqrt(4)
sqrt(16)


# Cria uma sequencia de numeros de 1 a 10
1:10


# Cria uma sequencia de numeros de 10 a 1
10:1


# Salva e printa uma sequencia de numeros num objeto
x <- 1:10

x

# Subtrai 1 de cada numero na sequencia anterior
x - 1


# Salva a sequencia x (vetor) com o resultado da
# subtracao por 1
x <- x - 1


# Eleva cada numero de x ao quadrado
x^2


# A funcao sum soma todos os numeros de um vetor
x <- 1:10
sum(x)


# Soma dois numeros
sum(2, 3)


# Soma tres numeros
sum(1, 2, 3)


# A funcao mean calcula a media de um vetor de numeros
x <- 1:10
mean(x)


# Calcula a media de dois numeros
numeros <- c(1, 3)
mean(numeros)


# Salva o resultado da media entre dois numeros
resultado <- mean(1, 3)


# O R e' case sensitive, o que significa que caixa baixa e alta faz diferenca:

Resultado # da' erro
resultado # printa o resultado da media de 1 e 3 sem erro


# A funcao rep cria uma sequencia de numeros
rep(1, 3)


# Podemos criar uma sequencia de 10 numeros '2'
rep(2, 10)


# A funcao rep tambem pode ser usada para repetir strings:
rep("exemplo", 10)


# A funcao seq cria uma sequencia crescente ou decrescente:
seq(1, 10)

seq(10, 1)


# Podemos especificar o intervalo da sequencia por meio do argumento
# by. Exemplo:
seq(1, 10, by = 0.5)


# Podemos salvar dois vetores criados com seq e somar eles
x <- seq(1, 10)
z <- seq(10, 1)

x + z 


# Podemos criar um vetor de numeros com a funcao numeric

numeric(10) # Cria um vetor com dez 0's


# Acessa a documentacao da funcao numeric
help(numeric)


# Acessa a documentacao da funcao seq
help(seq)


# Acessa a documentacao da funcao seq (jeito mais simples)
?seq




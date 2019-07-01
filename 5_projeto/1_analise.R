# ---
# 1 EXEMPLO DE ANALISE
# ---


# Pacotes necessarios
library(tidyverse)
library(stargazer)
library(here)


# Carrega os dados ja' limpos
load(here("dados", "pbf_2010_limpo.Rda"))


# Agora, iremos realizar algumas analises, simples, no banco que limpamos. Vamos tentar, especificamente,
# examinar se a cobertura do PBF em 2010 tem relacao com o desempenho de Dilma no primeiro turno das
# eleicoes do mesmo ano. Para isto, vamos usar uma combinacao de estatisticas descritivas, graficos e
# modelos lineares.


# Grafico 1 - Examina a relacao bivariada entre cobertura do PBF e votos na Dilma em 2010 (1 turno)
ggplot(bf, aes(x = alcance_2010, y = dilma_vs_2010)) + 
  geom_point() +
  geom_smooth(method = "lm", color = "orange") +
  scale_y_continuous(limits = c(0, 1)) +
  labs(x = "Alcance do PBF (%)", 
       y = "Votos na Dilma em 2010 (%)",
       title = "PBF vs. votação da Dilma em 2010 (1º turno)") +
  theme_classic()

ggsave("resultados/grafico1.png", width = 8, height = 6, type = "cairo-png")


# Grafico 2 - Examina a relacao bivariada entre cobertura do PBF e PIB em 2009 (log)
ggplot(bf, aes(x = alcance_2010, y = pib_2009_log)) + 
  geom_point() +
  geom_smooth(method = "lm", color = "orange") +
  labs(x = "Alcance do PBF (%)", 
       y = "PIB em 2009 (log)",
       title = "PBF vs. PIB em 2009 (log)") +
  theme_classic()

ggsave("resultados/grafico2.png", width = 8, height = 6, type = "cairo-png")


# Grafico 3 - Examina a relacao multivariada entre cobertura do PBF, PIB e votos na Dilma
ggplot(bf, aes(x = alcance_2010, y = dilma_vs_2010, color = pib_2009_log)) + 
  geom_point() +
  geom_smooth(method = "lm", color = "orange") +
  scale_y_continuous(limits = c(0, 1)) +
  scale_color_gradient(low = "gray", high = "black") +
  labs(x = "Alcance do PBF (%)", 
       y = "Votos na Dilma em 2010 (%)",
       title = "PBF vs. votação da Dilma em 2010 (1º turno)",
       color = "PIB (log)") +
  theme_classic()

ggsave("resultados/grafico3.png", width = 8, height = 6, type = "cairo-png")


# Tabela 1 - Matriz de correlacao entre covariaveis e alcance do PBF (excluindo NAs)
tab1 <- cor(bf[, c(3:8)], use = "complete.obs")

stargazer(tab1, type = "html", digits = 2, out = "resultados/tabela1.html")


# Tabela 2 - Modelos lineares
modelo1 <- lm(dilma_vs_2010 ~ alcance_2010, data = bf) # PBF vs. votacao na Dilma

modelo2 <- lm(dilma_vs_2010 ~ alcance_2010 + gini_2000 + hdi_2000 + nonwhite_2010 + 
                pop_2010_log + pib_2009_log, data = bf) # PBF vs. votacao na Dilma + controles

modelo3 <- lm(dilma_vs_2010 ~ alcance_2010 + gini_2000 + hdi_2000 + nonwhite_2010 + 
                pop_2010_log + pib_2009_log + state, data = bf) # PBF vs. votacao na Dilma + controles +
                                                                # efeito-fixo para estados


stargazer(modelo1, modelo2, modelo3, type = "html", omit = "state", out = "resultados/tabela2.html")


# Apaga os objetos da memoria.
rm(list = ls())


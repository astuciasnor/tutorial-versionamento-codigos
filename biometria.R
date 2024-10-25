#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
#             Criação de gráfico de dispersão de pontos
#
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
library(ggplot2)
library(readr)

# Importando dados de biometria ------------------------------------------------
dados <- read_csv("dados/biometria.csv")

# Visualizando o conjunto de dados 
print(dados)

# Crie a base do grafico usando ggplot2  ---------------------------------------
dados |> 
  ggplot(aes(x = `Comprimento (cm)`, y = `Peso (g)`))

# Acrescente a camada de pontos ------------------------------------------------
dados |> 
  ggplot(aes(x = `Comprimento (cm)`, y = `Peso (g)`)) +
  geom_point() 

# Acrescente o título, uma reta e mude o tema ----------------------------------
dados |> 
  ggplot(aes(x = `Comprimento (cm)`, y = `Peso (g)`)) +
  geom_point() +
  labs(title = "Gráfico de dispersão") +
  geom_smooth(method = "lm") +
  theme_minimal()


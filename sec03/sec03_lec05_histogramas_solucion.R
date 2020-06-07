# Curso de manipulación de datos en R para analisis

# lección - histograma

# ------------------------------------------------
# Objetivo: introducción a histograma
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. hacer histogramas en base graphics
# 2. hacer histogramas con ggplot2

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. hacer histogramas en base graphics
# ------------------------------------------------

# escogiendo datos 2007 con filter()
gapminder2007 <- gapminder %>% 
  filter(year == 2007)

# histograma con R base graphics
hist(gapminder2007$lifeExp)

# breaks o bins de histograma
hist(gapminder2007$lifeExp,
     breaks = 15)

hist(gapminder2007$lifeExp,
     breaks = seq(10,100,10))

# ------------------------------------------------
# 2. hacer histogramas con ggplot2
# ------------------------------------------------

# grafica de barras en ggplot2
ggplot(data = gapminder2007,
       mapping = aes(x = lifeExp)) +
  geom_histogram()

# grafica de barras en ggplot2
ggplot(data = gapminder2007,
       mapping = aes(x = lifeExp)) +
  geom_histogram(bins = 6,
                 color = 'black') # 'white'

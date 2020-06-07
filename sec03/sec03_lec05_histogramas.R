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
  filter(year==2007)

# histograma con R base graphics
hist(gapminder2007$lifeExp)

# breaks o bins de histograma
hist(gapminder2007$lifeExp,
     breaks = 20)

hist(gapminder2007$lifeExp,
     breaks = c(39.6,60,80,100))

hist(gapminder2007$lifeExp,
     breaks = seq(0,100,10))

# ------------------------------------------------
# 2. hacer histogramas con ggplot2
# ------------------------------------------------

# histograma en ggplot2
ggplot(data=gapminder2007,
       mapping= aes(x = lifeExp)) +
  geom_histogram()

ggplot(data=gapminder2007,
       mapping= aes(x = lifeExp)) +
  geom_histogram(bins=10) 

ggplot(data=gapminder2007,
       mapping= aes(x = lifeExp)) +
  geom_histogram(bins=10, col='white')

ggplot(data=gapminder2007,
       mapping= aes(x = lifeExp)) +
  geom_histogram(bins=10, col='black')

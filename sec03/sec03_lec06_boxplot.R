# Curso de manipulación de datos en R para analisis

# lección - boxplot

# ------------------------------------------------
# Objetivo: introducción a boxplot
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. hacer boxplot con base graphics
# 2. hacer boxplots en ggplot2

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. hacer boxplot con base graphics
# ------------------------------------------------

# escogiendo datos 2007 con filter()
gapminder2007 <- gapminder %>%
  filter(year==2007)

# haciendo boxplot básico
boxplot(gapminder2007$lifeExp)

# varias variables
boxplot(lifeExp ~ continent, gapminder2007)

# ------------------------------------------------
# 2. hacer boxplots en ggplot2
# ------------------------------------------------

# boxplot en ggplot2
ggplot(data=gapminder2007,
       mapping=aes(y=lifeExp))+
  geom_boxplot()

# boxplot varias variables ggplot2
ggplot(data=gapminder2007,
       mapping=aes(x=continent,y=lifeExp))+
  geom_boxplot()

# cambiando color de cajas y girando
ggplot(data=gapminder2007,
       mapping=aes(x=continent,
                   y=lifeExp,
                   fill=continent))+
  geom_boxplot()
  
ggplot(data=gapminder2007,
       mapping=aes(x=continent,
                   y=lifeExp,
                   fill=continent))+
  geom_boxplot() +
  coord_flip()


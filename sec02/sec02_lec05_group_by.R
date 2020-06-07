# Curso de manipulación de datos en

# lección - verbo summarise() y group_by() dplyr

# ------------------------------------------------
# Objetivo: agrupar y resumir tablas
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. sumarizar toda una tabla
# 2. agrupar por una variable y sumarizar
# 3. agrupar por varias variable y sumarizar

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. sumarizar toda una tabla
# ------------------------------------------------

# máximo de esperanza de vida
gapminder %>% summarise(max_edv=max(lifeExp))

# podemos buscar el pais con filter
gapminder %>% filter(lifeExp >= 82.6)

# calcular suma total de poblacion e 2007
gapminder %>% filter(year==2007) %>% 
  summarize(total_pob=sum(as.numeric(pop)))

# otras funciones para usar en summarise
# sum()
# mean()
# median()
# min()
# max()
# n()

# ------------------------------------------------
# 2. agrupar por una variable y sumarizar
# ------------------------------------------------

# EDP por año
gapminder %>% 
  group_by(year)  %>% 
  summarise(mean_edv = mean(lifeExp) )

# poblacion y conteos por continente para 2007
gapminder %>% 
  filter(year==2007) %>% 
  group_by(continent) %>% 
  summarise( sum_pop= sum(as.numeric(pop)),
             n_paises = n())
  
# ------------------------------------------------
# 3. agrupar por varias variable y sumarizar
# ------------------------------------------------

# suma de poblacion por año por continente
gapminder %>% 
  group_by(year, continent) %>% 
  summarise( sum_pop= sum(as.numeric(pop)))


# suma de poblacion por continente y por año
gapminder %>% 
  group_by(continent, year) %>% 
  summarise( sum_pop= sum(as.numeric(pop)))

# los resultados son los mismo, pero no el orden

# para terminar vamos con un gráfico
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_edp= mean(lifeExp)) %>% 
  ggplot(aes(x=year,y=mean_edp,color=continent)) +
  geom_line()




# Curso de manipulación de datos en R

# lección - verbo select() dplyr

# ------------------------------------------------
# Objetivo: seleccionar datos
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. seleccionar una o más columnas
# 2. seleccionar rangos y "eliminar" columnas
# 3. starts_with(), ends_with(), contains()

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. seleccionar una o más columnas
# ------------------------------------------------

# ver columnas de datos
colnames(gapminder)

# seleccionar una columna
gapminder %>% select(country)

# seleccionar varias columnas
# opcion 1
gapminder %>% 
  select(country,pop)

# opcion 2
gapminder %>% 
  select(c(country,pop))

# utilidad por si las columnas están en variables
columnas_interes <- c('country', 'pop' )
gapminder %>% 
  select(columnas_interes)

# ------------------------------------------------
# 2. seleccionar rangos y "eliminar" columnas
# ------------------------------------------------

# escoger rango de columnas
gapminder %>% 
  select(2:4)

gapminder %>% 
  select(1, 3:5)

# "eliminar" columnas
gapminder %>% 
  select(-continent)

gapminder %>% 
  select(-continent, -gdpPercap)

gapminder %>% 
  select(-c('continent', 'gdpPercap'))

# ------------------------------------------------
# 3. starts_with(), ends_with(), contains()
# ------------------------------------------------
gapminder %>% 
  select(starts_with('c') )

gapminder %>% 
  select(starts_with('c') | starts_with('l'))

# ejemplo con iris dataset
data_iris <- iris

# starts_with()
data_iris %>% 
  select(starts_with('Sepal'))

# ends_with()
data_iris %>% 
  select(ends_with('Length'))

# contains()
data_iris %>% 
  select(contains('.'))

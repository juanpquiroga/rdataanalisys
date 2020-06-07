# Curso de manipulación de datos en R con Rafa

# lección - verbo filter() dplyr

# ------------------------------------------------
# Objetivo: filtrar observaciones
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. filtrar por una condicion
# 2. filtrar por varias condiciones
# 3. otras condiciones logicas |, &, - (negar)

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. filtrar por un valor
# ------------------------------------------------
# ver columnas de datos
colnames(gapminder)

# filtrar un pais (caracter)
gapminder %>% 
  filter(country == 'Portugal')

# filtrar por edad exactamente 40 (numérica)
gapminder %>% 
  filter(lifeExp == 40)

# filtrar por edad mayor a 40 (peor no igual)
gapminder %>% 
  filter(lifeExp > 40)
# otras posibilidades
  # >= mayor o igual
  # >  mayor pero no igual
  # <= menor o igual
  # <  menor pero no igual
  # != distinto

# ------------------------------------------------
# 2. filtrar por más de un valor
# ------------------------------------------------

# filtrar dos (o mas) paises
gapminder %>% 
  filter(country %in% c('Portugal','Spain'))

# filtrar por rango de edades
gapminder %>% 
  filter(lifeExp >= 45,
         lifeExp <= 55)

# combinando filtros caracter y numérico
gapminder %>% 
  filter(country == 'Portugal',
         lifeExp >= 70)


# ------------------------------------------------
# 3. filtrar con operadores lógicos
# ------------------------------------------------

# operadores lógicos
  # ! representa la negación
  # & representa la "y", AND en inglés
  # | representa la "o", OR en inglés

# combinando condiciones con & (y, AND)
gapminder %>% 
  filter(country == 'Portugal' & year == 1952)

# combinando condiciones con | (o, OR)
gapminder %>% 
  filter(country == 'Portugal' | year == 1952)

# combinando condiciones con | (o, OR)
gapminder %>% 
  filter(!country == 'Portugal')

gapminder %>% 
  filter(!year == 1952)

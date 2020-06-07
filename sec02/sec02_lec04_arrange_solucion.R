# Curso de manipulación de datos en R con Rafa

# lección - verbo arrange() dplyr

# ------------------------------------------------
# Objetivo: ordenar observaciones
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. ordenar ascendente (de menor a mayor)
# 2. ordenar descendente (de mayor a menor)
# 3. ordenar por varias columnas

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. ordenar ascendente (de menor a mayor)
# ------------------------------------------------

# ordenar por poblacion
gapminder %>% 
  arrange(pop)

# ordenar por pais para el año 2007
gapminder %>% 
  filter(year==2007) %>% 
  arrange(country)

# ------------------------------------------------
# 2. ordenar descendente (de mayor a menor)
# ------------------------------------------------

# ordenar por poblacion
gapminder %>% 
  arrange(desc(pop))

# ordenar por pais para el año 2007
gapminder %>% 
  filter(year == 2007) %>% 
  arrange(desc(country))

# ------------------------------------------------
# 3. ordenar por varias columnas
# ------------------------------------------------

# ordenar por continente luego por pais 
gm_order1 <- gapminder %>% 
  arrange(continent, country)

# ordenar por pais luego por continente
gm_order2 <- gapminder %>% 
  arrange(country, continent)

# ascendente por continente descendente por pais en 2007
gm_order3 <- gapminder %>% 
  filter(year == 2007) %>% 
  arrange(continent, desc(country))

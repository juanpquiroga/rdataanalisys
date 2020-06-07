# Curso de manipulación de datos en R con Rafa

# lección - verbo mutate() dplyr

# ------------------------------------------------
# Objetivo: crear (o mutar) nuevas variables 
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. crear variable con operaciones +-*/
# 2. crear variables con funciones matematicas
# 3. IMPORTANTE: crear variables con case_when()

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. crear variable con operaciones +-*/
# ------------------------------------------------
# crear año de final de vida
gapminder %>% 
  mutate(anio_final = year + lifeExp)

# crear años desde 1952
gapminder %>% 
  mutate(años_1952 = year - 1952)

# crear la poblacion en millones
gapminder %>% 
  mutate(pop_m = pop/1000000) 

# ------------------------------------------------
# 2. crear variables con funciones matematicas
# ------------------------------------------------

# redondear poblacion en millones
gapminder %>% 
  mutate(pop_m_r = round(pop/1000000,0))

# calcular logaritmo base 10 de la poblacion
gapminder %>% 
  mutate(log10_pop = log10(pop))

# calcular suma acumulada de poblacion para 2007
gapminder %>% 
  filter(year == 2007) %>% 
  mutate(cum_pop = cumsum(as.numeric(pop)))

# ------------------------------------------------
# 3. IMPORTANTE: crear variables con case_when()
# ------------------------------------------------

# cambiar nombre de continentes a español
gapminder %>% 
  distinct(continent)

gapminder_es <- gapminder %>% 
  mutate(cont_es = case_when(
    continent == 'Asia' ~ 'Asia',
    continent == 'Europe' ~ 'Europa',
    continent == 'Africa' ~ 'Africa',
    continent == 'Americas' ~ 'America',
    continent == 'Oceania' ~ 'Oceanía'
  ))

# crear variable segun tamaño de poblacion
quantile(gapminder$pop)
gapminder_pop <- gapminder %>% 
  mutate(mide_pop = case_when(
    pop <= 3000000 ~ 'pequeño',
    pop <= 20000000 ~ 'mediano',
    TRUE ~ 'grande'
  ))

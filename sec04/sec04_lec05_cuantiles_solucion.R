# Curso de manipulación de datos en R

# lección - Cuantiles y boxplot

# ------------------------------------------------
# Objetivo: estudiar la distribucion con cuantiles
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. Extraer cuantiles de los datos
# 2. Distribucion con boxplot
# 3. Distribucion con grafica de violin

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. Extraer cuantiles de los datos
# ------------------------------------------------

# mirar cuantiles de la poblacion en 2007
gapminder %>% 
  filter(year == 2007) %>% 
  select(lifeExp) %>% 
  pull() %>% 
  quantile()

# cuantiles especificos
gapminder %>% 
  filter(year == 2007) %>% 
  select(lifeExp) %>% 
  pull() %>% 
  quantile(probs = c(0.36, 0.67))

# ------------------------------------------------
# 2. Distribucion con boxplot
# ------------------------------------------------
# hacer boxplot
gapminder %>% 
  filter(year == 2007) %>% 
  select(lifeExp) %>% 
  ggplot(aes(y = lifeExp)) +
  geom_boxplot()

# hacer boxplot por continente
gapminder %>% 
  filter(year == 2007) %>% 
  select(lifeExp, continent) %>% 
  ggplot(aes(y = lifeExp,
             x = continent,
             fill = continent)) +
  geom_boxplot()

# ------------------------------------------------
# 3. Distribucion con grafica de violin
# ------------------------------------------------
# grafica de violin
gapminder %>% 
  filter(year == 2007) %>% 
  select(lifeExp, continent) %>% 
  ggplot(aes(y = lifeExp,
             x = continent,
             fill = continent)) +
  geom_violin()


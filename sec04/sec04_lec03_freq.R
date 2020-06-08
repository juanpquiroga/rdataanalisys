# Curso de manipulación de datos en R

# lección - conteos y proporciones

# ------------------------------------------------
# Objetivo: Extraer información tablas resumen
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. resumir tablas con paquete arsenal
# 2. graficar proporciones
# 3. hacer tablas de frecuencia

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. resumir tablas resumen con paquete arsenal
# ------------------------------------------------

# crear etiquetas para lifeExp
gapminder_2007 <- gapminder %>% filter(year==2007)
quantile(gapminder_2007$lifeExp)
gapminder_2007$life_label <- gapminder_2007$lifeExp %>% 
  cut(breaks=c(0,57.16,76.41,100),
      labels=c('baja','media','alta'))
head(gapminder_2007)

gapminder_1952 <- gapminder %>% filter(year==1952)
quantile(gapminder_1952$lifeExp)
gapminder_1952$life_label <- gapminder_1952$lifeExp %>% 
  cut(breaks=c(0,39.06,59.76,100),
      labels=c('baja','media','alta'))
head(gapminder_1952)


# install.packages("arsenal")
library(arsenal)

# ejemplo de tableby()
# año 1952
tab1952 <- gapminder_1952 %>% 
  tableby(continent ~ life_label, data=. ) %>% 
  summary(text=TRUE) %>% 
  as.data.frame()

head(tab1952)

# año 2007
tab2007 <- gapminder_2007 %>% 
  tableby(continent ~ life_label, data=. ) %>% 
  summary(text=TRUE) %>% 
  as.data.frame()

head(tab2007)


# ------------------------------------------------
# 2. graficar proporciones
# ------------------------------------------------
# graficando ambas opciones
gapminder %>% 
  filter(year %in% c(1952,2007)) %>% 
  ggplot(aes(x=continent,
             fill=life_label)) +
  geom_bar(position='fill') +
  coord_flip() + 
  facet_wrap(~year,
             ncol=1)

# ------------------------------------------------
# 3. hacer tablas de frecuencia
# ------------------------------------------------

# ejemplo de freqlist una variable
gapminder %>% 
  filter(year==2007) %>% 
  select(continent) %>% 
  table() %>% 
  freqlist() %>% 
  summary()


# ejemplo de freqlist dos variables
gapminder %>% 
  filter(year==2007) %>% 
  select(continent, life_label) %>% 
  table() %>% 
  freqlist() %>% 
  summary()


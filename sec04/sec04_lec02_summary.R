# Curso de manipulación de datos en R

# lección - estadisticas resumen

# ------------------------------------------------
# Objetivo: explorar datos con estadísticas
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. inspeccionar datos
# 2. Calcular estadísticas con dplyr
# 3. visualizar la regla empírica con ggplot2

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. inspeccionar datos
# ------------------------------------------------

# mirar estructura
str(gapminder)

# mirar resumen
gapminder %>% summary()
summary(gapminder)

# ------------------------------------------------
# 2. Calcular estadísticas con dplyr
# ------------------------------------------------

# media de vida por continente
gapminder %>% 
  filter(year==2007) %>% 
  summarise(vida_media=mean(lifeExp), 
            vida_sd=sd(lifeExp),
            vida_inf=vida_media-2*vida_sd,
            vida_sup=vida_media+2*vida_sd,
            vida_min=min(lifeExp),
            vida_max=max(lifeExp),
            n=n())

# ------------------------------------------------
# 3. visualizar la regla empírica con ggplot2
# ------------------------------------------------

# grafica para esperanza de vida
gapminder %>% 
  filter(year==2007) %>% 
  mutate(vida_media=mean(lifeExp), 
            vida_sd=sd(lifeExp),
            vida_inf=vida_media-2*vida_sd,
            vida_sup=vida_media+2*vida_sd,
            vida_min=min(lifeExp),
            vida_max=max(lifeExp),
            n=n()) %>% 
  ggplot(aes(x=lifeExp, y= 'y')) +
  geom_jitter() +
  geom_vline(aes(xintercept=vida_media), color='red') +
  geom_vline(aes(xintercept=vida_inf), color='green') +
  geom_vline(aes(xintercept=vida_sup), color='blue')

# regla empirica, el 95% de la poblacion está 
# en +/- 2 desviaciones tipicas de la media
142 * 0.05

gapminder %>% 
  filter(year==2007) %>% 
  mutate(vida_media=mean(lifeExp), 
         vida_sd=sd(lifeExp),
         vida_inf=vida_media-2*vida_sd,
         vida_sup=vida_media+2*vida_sd,
         vida_min=min(lifeExp),
         vida_max=max(lifeExp),
         n=n()) %>% 
  filter(vida_inf>lifeExp | vida_sup<lifeExp) 

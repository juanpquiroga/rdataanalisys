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
summary(gapminder)


# ------------------------------------------------
# 2. Calcular estadísticas con dplyr
# ------------------------------------------------

# media de vida por continente
gapminder %>% 
  filter(year == 2007) %>% 
  # group_by(continent) %>% 
  summarise(vida_media = mean(lifeExp),
            vida_sd = sd(lifeExp),
            vida_sdinf = vida_media - 2*vida_sd,
            vida_sdsup = vida_media + 2*vida_sd,
            npaises = n())

# ------------------------------------------------
# 3. visualizar la regla empírica con ggplot2
# ------------------------------------------------

# grafica para esperanza de vida
gapminder %>% 
  filter(year == 2007) %>% 
  # group_by(continent) %>% 
  mutate(mean_life = mean(lifeExp),
         sdinf_life = mean(lifeExp) - 2*sd(lifeExp),
         sdsup_life = mean(lifeExp) + 2*sd(lifeExp)) %>% 
  ggplot(aes(x = lifeExp, y = 'y')) +
  geom_vline(aes(xintercept = mean_life),
             color = 'red') +
  geom_vline(aes(xintercept = sdinf_life),
             color = 'blue') +
  geom_vline(aes(xintercept = sdsup_life),
             color = 'blue') +
  geom_jitter() +
  # facet_wrap(~continent) +
  NULL

# regla empirica, el 95% de la poblacion está 
# en +/- 2 desviaciones tipicas de la media




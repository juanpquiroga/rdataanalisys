# Curso de manipulación de datos en R

# lección - Distribuciones e histogramas

# ------------------------------------------------
# Objetivo: Estudiar distribuciones continuas
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. Histograma de variables continuas
# 2. Grafico de densidades en ggplot2
# 3. simular una distribución de datos

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. Histograma de variables continuas
# ------------------------------------------------

# escogiendo datos 2007 con filter()
gapminder2007 <- gapminder %>% 
  filter(year == 2007)

# grafica de barras con R base graphics
hist(gapminder2007$lifeExp)
hist(gapminder2007$pop)
hist(gapminder2007$gdpPercap)

# estudiando con más breaks
hist(gapminder2007$pop, breaks = 50)

# estudiando con transformación de la variable
hist(log(gapminder2007$pop))

# ------------------------------------------------
# 2. Grafico de densidades en ggplot2
# ------------------------------------------------
gapminder2007 %>% 
  ggplot(aes(x = gdpPercap)) +
  geom_density()

gapminder2007 %>% 
  ggplot(aes(x = pop)) +
  geom_density()

gapminder2007 %>% 
  ggplot(aes(x = log(pop))) +
  geom_density()

# ------------------------------------------------
# 3. simular una distribución de datos
# ------------------------------------------------
# esto da pie a pensar que la población
# de los paises sigue una distribución exponencial
# con parametro = 1/media
mu <- mean(log(gapminder2007$pop))
sig <- sd(log(gapminder2007$pop))

simu_data <- data.frame(x = exp(rnorm(n=142,
                                      mean=mu,
                                      sd=sig)))

hist(simu_data$x, n=50)

# grafica de barras horizontal
ggplot(data = simu_data,
       mapping = aes(x = x)) +
  geom_density()


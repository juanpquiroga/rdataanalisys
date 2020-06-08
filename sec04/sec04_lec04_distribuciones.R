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
gapminder_2007 <- gapminder %>% filter(year==2007)

# grafica de barras con R base graphics
hist(gapminder_2007$lifeExp)
hist(gapminder_2007$pop)
hist(gapminder_2007$gdpPercap)

# estudiando con más breaks
hist(gapminder_2007$pop, breaks = 50)
hist(gapminder_2007$gdpPercap, breaks = 50)

# estudiando con transformación de la variable
hist(log(gapminder_2007$pop), breaks = 10)
hist(log(gapminder_2007$gdpPercap), breaks = 50)

# ------------------------------------------------
# 2. Grafico de densidades en ggplot2
# ------------------------------------------------
gapminder_2007 %>% 
  ggplot(aes(x=lifeExp)) +
  geom_density()

gapminder_2007 %>% 
  ggplot(aes(x=log(pop))) +
  geom_density()

# ------------------------------------------------
# 3. simular una distribución de datos
# ------------------------------------------------
# esto da pie a pensar que la población
# de los paises sigue una distribución exponencial
# con parametro = 1/media
mu_hat <- mean(log(gapminder_2007$pop))
sigma_hat <- sd(log(gapminder_2007$pop))

# grafica de barras horizontal
simu_data = data.frame(x=exp(rnorm(n=142, mean=mu_hat, sd=sigma_hat)))
hist(gapminder_2007$pop, breaks = 50)
hist(simu_data$x, breaks = 50)

simu_data %>% 
  ggplot(aes(x=x)) +
  geom_density()



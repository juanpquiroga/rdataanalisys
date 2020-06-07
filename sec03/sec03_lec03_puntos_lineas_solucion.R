# Curso de manipulación de datos en R para analisis

# lección - grafico de puntos y lineas

# ------------------------------------------------
# Objetivo: iniciar en graficos de puntos y lineas
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. gráfica de puntos y lineas con base graphics
# 2. gráfica de puntos y lineas con ggplot2

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. gráfica de puntos y lineas con base graphics
# ------------------------------------------------

# escogiendo datos de portugal con filter()
gapminderpt <- gapminder %>% 
  filter(country == 'Portugal')

# grafica de puntos con R base graphics
plot(x = gapminderpt$year,
     y = gapminderpt$lifeExp)

# grafica de puntos con R base graphics
plot(x = gapminderpt$year,
     y = gapminderpt$lifeExp, 
     type = 'l')

# ------------------------------------------------
# 2. gráfica de puntos y lineas con ggplot2
# ------------------------------------------------

# grafica de puntos en ggplot2
ggplot(data = gapminderpt,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_point()

# grafica de lineas en ggplot2
ggplot(data = gapminderpt,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_line()

# grafica de puntos con linea de regresion
# grafica de puntos en ggplot2
ggplot(data = gapminderpt,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_point()+
  geom_smooth(method = 'lm')

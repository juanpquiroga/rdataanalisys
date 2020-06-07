# Curso de manipulación de datos en R para analisis

# lección - grafico de barras

# ------------------------------------------------
# Objetivo: iniciar en graficos de barras
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. hacer una gráfica de barras
# 2. diferenciar tipos de gráfica de barras

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. hacer una gráfica de barras
# ------------------------------------------------

# escogiendo datos 2007 con filter()
gapminder2007 <- gapminder %>%
  filter(year==2007)

# grafica de barras con R base graphics
barplot(table(gapminder2007$continent),
     xlab = 'continentes',
     ylab = 'Cantidad',
     main = 'Paises por continente',
)

# grafica de barras en ggplot2
ggplot(data = gapminder2007,
       mapping = aes(x=factor(continent))) +
  geom_bar() +
  xlab('Continente') +
  ylab('Cantidad') +
  ggtitle('Paises por continente') +
  theme(plot.title = element_text(hjust = 0.5))

# grafica de barras horizontal
ggplot(data = gapminder2007,
       mapping = aes(x=factor(continent))) +
  geom_bar() +
  xlab('Continente') +
  ylab('Cantidad') +
  ggtitle('Paises por continente') +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_flip()

# ------------------------------------------------
# 2. diferenciar tipos de gráfica de barras
# ------------------------------------------------

# creando variable con mutate()
gapminder2007 <- gapminder2007 %>% 
  mutate( lifeExp_label = case_when(
    lifeExp < 50 ~ 'baja',
    lifeExp < 70 ~ 'media',
    TRUE ~ 'alta'
  ))

# guardando grafica en variable
p <- ggplot(data= gapminder2007,
            mapping=aes(x=factor(continent),
                        fill=factor(lifeExp_label)))

# stacked bar chart
p +
  geom_bar(position='stack',stat='count')

# dodge bar chart
p +
  geom_bar(position='dodge',stat='count')

# stacked + percent barchart
p +
  geom_bar(position='fill',stat='count')

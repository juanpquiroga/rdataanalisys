# Curso de manipulación de datos en R

# lección - dependencia y correlacion

# ------------------------------------------------
# Objetivo: explorar correlacion entre datos
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. buscar correlaciones en datos
# 2. formas de graficar la matriz de correlacion
# 3. graficar correlacion encontrada

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# ------------------------------------------------
# 1. buscar correlaciones en datos
# ------------------------------------------------
# mirando todas las graficas de puntos a la vez
gapminder %>% 
  filter(year==2007) %>% 
  select(year, lifeExp, pop, gdpPercap) %>% 
  pairs()

# cambiando a escala logaritmica
gapcor <- gapminder %>% 
  filter(year==2007) %>% 
  mutate(log_pop=log(pop),
         log_gdp=log(gdpPercap)) %>% 
  select(lifeExp, log_pop, log_gdp)

gapcor %>% 
  pairs()

gapcor %>% 
  cor()

# ------------------------------------------------
# 2. formas de graficar la matriz de correlacion
# ------------------------------------------------

# graficar la matriz de correlacion
#install.packages('corrplot')
library(corrplot)


# otra forma de estudiar correlacion
# install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

gapcor %>% 
  cor() %>% 
  corrplot(type='upper', order='hclust',
           tl.col = 'black',
           tl.srt = 45)

gapcor %>% 
  chart.Correlation(histogram = TRUE,
                    pch=19)


# ------------------------------------------------
# 3. graficar correlacion encontrada
# ------------------------------------------------
# grafica para gapcor
gapcor %>% 
  ggplot(aes(x=lifeExp,
             y = log_gdp)) +
  geom_point() +
  geom_smooth(method='lm') +
  geom_text(aes(label=round(cor(lifeExp,log_gdp),2)),
            x=70, y=6)

# viendo tendencia a lo largo de los años
gapminder %>% 
  group_by(year) %>% 
  mutate(log_gdp=log(gdpPercap),
         rsq=round(cor(lifeExp,log_gdp),2)) %>% 
  select(year, lifeExp, log_gdp, rsq) %>% 
  ggplot(aes(x=lifeExp,
             y = log_gdp)) +
  geom_point() +
  geom_smooth(method='lm') +
  geom_text(aes(label=rsq),
            x=70, y=6)+
  facet_wrap(~year)
    

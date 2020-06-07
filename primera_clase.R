
# instalar paquetes requeridos
# install.packages('gapminder')
# install.packages('tidyverse')

# cargar paquete de datos
library(gapminder)

# cargar paquete de analisis
library(tidyverse)

# cargar datos
data("gapminder")

# ver encabezado de datos
head(gapminder)

# para que años está la información
distinct(gapminder, year)

# para que paises esta la información
distinct(gapminder, country)

# mostrar todos los datos
print(distinct(gapminder, country), n=142)

# como se ve la esperanza de vida en 2007 para Colombia
gapminder %>% 
  filter(country=='Colombia', year==2007)

# como se ve la esperanza de vida en 2007 para España
gapminder %>% 
  filter(country=='Spain', year==2007)

# Grafica
gapminder %>% 
  filter(continent == 'Americas', year == 2007 ) %>% 
  ggplot(aes(x=lifeExp,y=country)) +
  geom_point()
    
# Que pais tiene la minima esperanza de vida en Europa
gapminder %>% 
  filter(continent=='Europe',year==2007) %>% 
  ggplot(aes(x=lifeExp,y=country)) +
  geom_point()

data_europa = gapminder %>% 
  filter(continent=='Europe',year==2007) %>% 
  arrange( lifeExp )

print(data_europa, n=30)

# Que pais tiene la minima esperanza de vida en America
data_americas = gapminder %>% 
  filter(continent=='Americas',year==2007) %>% 
  arrange( -lifeExp )

print(data_americas, n=30)

# Ejercicio como es la esperanza de vida en tu pais
gapminder %>% 
  filter(country=='Colombia') %>% 
  ggplot(aes(x=year,y=lifeExp)) +
  geom_point()


anhos = gapminder %>% distinct(year)
data = c(1,2,3,4,5,6,7,8,9,10,11,12)
transformar_data= data.frame(anhos,data)

names(transformar_data) = c("anhos","data")

(transformar_data %>% filter(anhos==2007))[2]

# No funciona
#gapminder %>% select(country,year) %>% mutate(year_real = (transformar_data %>% filter(anhos==2007))[2])

gapminder %>% 
  filter(continent=='Americas',year==2007) %>% 
  summarise(min(lifeExp), max(lifeExp))

year <- c('2010','2011','2012','2013', '2014', '2015', '2016','2017')
disney <- c(11,13,11,8,11,12,8,10)

plot(x=year, y=disney)

plot(x=year,
     y = disney,
     main = 'disney',
     xlab = '',
     ylab = '',
     col='cornflowerblue',
     pch = 16,
     panel.first = grid()
     )

# graficar utilizando ggplot
library(ggplot2)
peliculas <- data.frame(year, disney)

ggplot(data= peliculas, mapping =  aes(x=year,
                                       y = disney)) +
  geom_point() +
  labs(title = 'disney')
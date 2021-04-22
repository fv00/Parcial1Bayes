set.seed(210421)
valores = c(9, 10, 12, 15 , 20)
frecuencias = c(5,15,55,25,5)
nSim = 1000
nSeguridad =  6

## Tomamos nSim muestras de tamaño nSeguridad y a cada muestra le tomamos el promedio

medias <- apply(matrix(sample(valores, nSim*nSeguridad, replace = T, prob = frecuencias), ncol = nSeguridad),1, mean)
#hist(medias, freq=F)

library(MASS)
fitdistr(medias, 'gamma')
forma = 168.1497483 
ratio = 13.3024697
sequency = seq(from= 5, to=25, by = 0.01)
hist(medias)
gammaAjustada = dgamma(sequency, shape = forma , rate= ratio)
lines(sequency, gammaAjustada, lwd=2)
library(ggplot2)
ggplot(data.frame(gammaAjustada), aes(x = sequency, y=gammaAjustada)) + geom_point()
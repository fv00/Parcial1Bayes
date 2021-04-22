set.seed(210421)

muestras = runif(n = 1000, 4300, 4700)
library(ggplot2)
ggplot(data=data.frame(muestras), aes(muestras)) + geom_histogram()
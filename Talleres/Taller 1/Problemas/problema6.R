require(PolynomF)
require(graphics)
library(graphicsQC)

rm(list=ls())
yinicial<-c(3, 3.7, 3.9, 4.5, 5.7, 6.69, 7.12, 6.7, 4.45, 7, 6.1, 5.6, 5.87, 5.15, 4.1, 4.3, 4.1, 3)
xinicial<-c(1, 2, 5, 6, 7.5, 8.1, 10, 13, 17.6, 20, 23.5, 24.5, 25, 26.5, 27.5, 28, 29, 30)
plot(xinicial, yinicial, col="blue")


y<-c(3, 3.7, 4.5, 6.69, 6.7, 4.45, 7, 5.6, 5.15, 4.1, 4.1, 3)
x<-c(1, 2, 6, 8.1, 13, 17.6, 20, 24.5, 26.5, 27.5, 29, 30)

#puntos usados

y1 = y[1:6]   ; x1=x[1:6]
y2 = y[6:10]  ; x2 = x[6:10]
y3 = y[10:12] ; x3 = x[11:12]


n <- length(x)
dog_c = 2

plot(x, y, pch=20,main = paste("Interpolacion con", n, "puntos"),xlim=c(0,31),ylim=c(0,9))
lines(spline(x1, y1, n = 201), col = dog_c,xlim=c(0,31),ylim=c(0,9))
lines(spline(x2, y2, n = 201), col = dog_c,xlim=c(0,31),ylim=c(0,9))
lines(spline(x3, y3, n = 201), col = dog_c,xlim=c(0,31),ylim=c(0,9))


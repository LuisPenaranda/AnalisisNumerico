library(PolynomF)

xi=c(0,1,2)
xi
yi=c(10,15,5)
p3 = poly_calc(xi,yi)
p3
range(p3(xi) - yi) 
#polyAjuste
plot(xi,yi, pch = 19, cex=1, col= "red")
curve(p3,add=T,lty=3, lwd=2)
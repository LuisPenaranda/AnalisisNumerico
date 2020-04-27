library(PolynomF)

xi=c(0,1,2)
yi=c(10,15,5)
polyAjuste = poly_calc(xi,yi)
#polyAjuste
plot(xi,yi, pch = 19, cex=1.5, col= "red")
splineAjuste=splinefun(xi,yi) # frontera natural
curve(splineAjuste,add=T,lty=1,lwd=4)
curve(polyAjuste,add=T,lty=2, lwd=4, col= "yellow") # lwd = grosor, lty = tipo
# Usando trazadores cúbicos

splineAjuste.mono = splinefun(xi,yi,method="mono")#curva monótona
splineAjuste.mono
curve(splineAjuste.mono,add=T,lty=1, lwd = 4,col = "purple")
legend("bottomright",legend=c("Interpolante","Trazador"), lty=c(2:1),bty="n")

prima <- deriv(polyAjuste)
curve(prima,add=T,lty=4, lwd = 4,col = "orange")


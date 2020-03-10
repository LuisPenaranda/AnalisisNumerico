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

cubicSpline <- function(x,y) {
  
  a = rep(y)
  n = length(x)
  
  h <- (c(x,0) - c(0,x))[2:n]
  alph <- (3/c(1,h,1,1)*(c(a,1,1) - c(1,a,1)) - 3/c(1,1,h,1)*(c(1,a,1)-c(1,1,a)))[3:n]
  
  A <- c(1,rep(0,times=n-1))
  for (i in 1:(n-2)) {
    A <- rbind(A,c( rep(0,times=i-1) , c(h[i],2*(h[i]+h[i+1]),h[i+1]) , rep(0,times=n-i-2) ) )
  }
  
  A <- rbind(A,c(rep(0,times=n-1),1))
  b <- c(0,alph,0)
  c <- solve(A, b)
  
  b <- ((c(a,0) - c(0,a))/c(1,h,1) - c(1,h,1)/3*(c(c,0) + 2*c(0,c)))[2:n]
  d <- ((c(c,0) - c(0,c))/(3*c(1,h,1)))[2:n]
  ans = rbind(a[1:n-1],b,c[1:n-1],d)
}

draw <- function(x,y) {
  t = 1:length(x)
  sx = cubicSpline(t,x)
  sy = cubicSpline(t,y)
  
  for (i in 1:(length(t)-1)) {
    dat<- data.frame(t=seq(t[i],t[i+1], by=0.1) )
    fx <- function(x) (sx[1,i] + sx[2,i]*(x-t[i]) + sx[3,i]*(x-t[i])^2 + sx[4,i]*(x-t[i]))
    fy <- function(x) (sy[1,i] + sy[2,i]*(x-t[i]) + sy[3,i]*(x-t[i])^2 + sy[4,i]*(x-t[i]))
    
    dat$y=fy(dat$t)
    dat$x=fx(dat$t)
    points(dat$x,dat$y,type='l', col='blue')
  }
}
draw(x,y)


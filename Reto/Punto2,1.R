# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

library(pracma)

f <- function(x){ 
  return (sin(x))
}

evaluar <- function(x, poli){
  grado <- length(poli)-1
  aux <- 0
  cont <- 0
  for(i in poli){
    aux <-  aux + i*(x^grado)
    grado <- grado - 1
    cont <- cont + 2
  }
  return (cat("Evaluado en Taylor:", aux, "\n", 
              "En Seno:", sin(x),"\n", 
              "Num de operaciones:", cont, "\n",
              "Error relativo:", aux-sin(x), "\n"))

}

p <- taylor(f, 0, 3)

particion <- (pi/64-(-pi/64))/10
x <- -pi/64
puntos <- c()

for(i in 1:10){
  puntos <- c(puntos, x)
  x <- x + particion
}

for(i in puntos){
  cat(evaluar(i, p))
}

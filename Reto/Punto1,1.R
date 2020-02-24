# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

horner <- function(coeficientes, x){
  y <- coeficientes[1]
  i <-0
  
  for(k in coeficientes[2:length(coeficientes)]){
    y <- x*y + k
    i <- i + 2
  }
  return(cat("resultado: ",y ,", El numero de operaciones realizadas fueron de: ", i, " siendo ", i/2 , "el numero de multiplicaciones y ", i/2 , "el numero de sumas realizadas"))
}
derivar <- function(coeficientes){
  
  grado <- length(coeficientes)-1
  deriv <- c()
  for(i in coeficientes[1:length(coeficientes)-1]){
    aux <- i*grado
    deriv <- c(deriv, aux)
    grado <- grado - 1
  }
  return (deriv)
}

x0 <- -2
coeficientes <- c(2,0,-3,3,-4)
derivada <- derivar(coeficientes)
horner(derivada,x0)

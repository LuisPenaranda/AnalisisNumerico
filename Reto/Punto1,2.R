horner <- function(coeficientes, x){
  y <- coeficientes[1]
  i <-0
  
  for(k in coeficientes[2:length(coeficientes)]){
    y <- x*y + k
    i <- i + 2
  }
  return(cat("Resultado: ", y ,", El numero de operaciones realizadas fueron de: ", i, " siendo ", i/2 , "el numero de multiplicaciones y ", i/2 , "el numero de sumas realizadas"))
}
x0 <- complex(real = 2, imaginary = 1)

coeficientes <- c(2,0,-3,3,-4)
horner(coeficientes,x0)
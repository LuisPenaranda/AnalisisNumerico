# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

sumaDeNaturales <- function(x)
{
  v <- c()
  for( i in x)
  {
    suma = 0
    
    for(d in 0:i^2)
    {
      suma = suma + d^2
    }
    v = c(v,suma)
  }
  plot(x,v,xlab="Numero",ylab="Sumas")
  lines(x, v, col = "blue")
  
  
  
}
x<-c(20, 40, 60, 80, 100, 150, 200, 250, 300, 350, 400, 450, 500)

sumaDeNaturales(x)
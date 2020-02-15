# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

trayectoria = function()
{
  t <- 0
  val1 <- 6+2.13*(t^2)-0.0013*(t^4)
  val2 <- 6+2.13*((t+1)^2)-0.0013*((t+1)^4)
  while(val1<val2)
  {
    
    t <- t+1
    val1 <- 6+2.13*(t^2)-0.0013*(t^4)
    val2 <- 6+2.13*((t+1)^2)-0.0013*((t+1)^4)
    
  }
  cat("altura maxima: ",val1, "metros")
  
  
}
trayectoria()
# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

comprobar = function(a){
  x = a
  z = a
  result1 = 0
  result2 = 0
  
  for(i in 0:50)
  {
    result1 = round(x^i + result1,10)  
  }
  
  result2 = ((z^51)-1)/(z-1)
  cat("resultado 1: ", result1)
  cat(" resultado 2: ",result2)
}  
options(digits=12)
comprobar(1.0001)
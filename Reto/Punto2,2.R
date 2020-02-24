remez <- function(infe,supe,grado,error){
  
  f <- function (x) sin(x)
  #para un grado n se necesita n+1 coeficientes 
  longitud = (2*(pi/64))/(grado-1)
  x = c()
  y = c()
  valor_punto = 0
  absoluto = 0
  relative = 0
  i =1
  while (length(x)<grado)
  {
    if (length(x) == 0 )
    {
      x[i]= infe
      i = i +1
    }
    x[i] = (x[i-1]+(longitud))
    print (x[i])
    i = i+1
    
  }
  j = 1
  while (j < grado+1 )
    
  {
    y[j]= f(x[j])
    print (y[j])
    j = j+1
  }
  y[j] = cos(supe*(1/2))
  
  if(grado == 1){
    n = rbind(c(1,x[1]),
              c(0,1))
  }
  if(grado == 2){
    n = rbind(c(1,x[1],(x[1])^2),
              c(1,x[2],(x[2])^2),
              c(0,1,2*(pi/128))
    )
  }
  if(grado == 3){
    n = rbind(c(1,x[1],(x[1])^2,(x[1])^3),
              c(1,x[2],(x[2])^2,(x[2])^3),
              c(1,x[3],(x[3])^2,(x[3])^3),
              c(0,1,2*(pi/128),3*(pi/128)^2))
  }
  if(grado == 4){
    n = rbind(c(1,x[1],(x[1])^2,(x[1])^3,(x[1])^4),
              c(1,x[2],(x[2])^2,(x[2])^3,(x[2])^4),
              c(1,x[3],(x[3])^2,(x[3])^3,(x[3])^4),
              c(1,x[4],(x[4])^2,(x[4])^3,(x[4])^4),
              c(0,1,2*(pi/128),3*(pi/128)^2,4*(pi/128)^3)) 
  }
  
  z=solve(n,y)
  
  if(grado == 1){
    h = function(x) z[1]+(z[2]*x)
  }
  if(grado == 2){
    h = function(x) z[1]+(z[2]*x)+(z[3]*x^2)
  }
  if(grado == 3){
    h = function(x) z[1]+(z[2]*x)+(z[3]*x^2)+(z[4]*x^3)
  }
  if(grado == 4){
    h = function(x) z[1]+(z[2]*x)+(z[3]*x^2)+(z[4]*x^3)+(z[5]*x^4)
  }
  
  plot(f, xlim = c(-3,3),ylim=c(-2,2), col="red", ylab = "y")
  par(new = T)
  plot(h, xlim = c(-3,3),ylim=c(-2,2), col="blue", main = "Remez vs. Seno", ylab = "y")
  valor_punto = pi/128
  absoluto = abs((f(valor_punto)- h(valor_punto)))*error
  relative  = ((absoluto / h(valor_punto))*100)*error
  
  return(cat("Punto:", valor_punto, "\n ", "Error relativo:", relative, "\n"))

}

print(remez (-pi/64,pi/64,3,10^-8))


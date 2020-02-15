# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

f = function(x)
{
  return (x^2-cos(x))
}

Gx = function(x) return (sqrt(cos(x)))

vectorAux =0

puntoFijo = function(a,b,i)
{
  if((Gx(a)-a)*(Gx(b)-b) < 0)
  {
    x=(a+b)/2
    iteraciones = 0
    vectorAux = 0
    dx = 0
    tol = 1e-8
    
    while (Gx(x) != x & iteraciones < i) 
    {
      dx=abs(a-b)/2
      
      if(dx > tol)
      {
        if (Gx(x) < x)
        {
          b = x
        }
        else {a = x}
      }
      else 
      {
        break
      }  
      x=(a+b)/2
      vectorAux = c(vectorAux,x)
      iteraciones = iteraciones+1
    }
    vectorAux <<- vectorAux
    return(x)
    
  }
  else
  {
    cat("No tiene raiz la funcion en ese intervalo\n")
  }
}


# MÃ©todo aitken
aitken = function(x,xPos1,xPos2)
{
  
  resultado = xPos2 - (((xPos2 - xPos1)^2)/(xPos2 -2*xPos1+x)) 
  
  return(resultado)
}

i =18
iteracion = 3
puntoFijo(0,1,i)
x2 = 0.824132919311523
x3 = 0.824137369791667
while(iteracion < i ){
  cat("i= ",iteracion," x=", aitken(vectorAux[iteracion-2],vectorAux[iteracion-1],vectorAux[iteracion]),"\n")
  iteracion = iteracion +1
}
cat("Resultado sin aceleracion: ", puntoFijo(0,1,i), "\n")
cat("Resultado con aceleracion: ", aitken(vectorAux[i-3],vectorAux[i-2],vectorAux[i-1]), "\n")
cat("Valor real de la solucion: 0.8241323123")
cat("Resultado sin aceleracion: ", x2 , "\n")
cat("Resultado con aceleracion: ", x3, "\n")
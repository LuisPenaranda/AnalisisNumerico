Newton = function(Fx, Gx, x0, tol, maxiter)
{
  
  # Listas que contendrán los valores a graficar
  listaErrorAnt = c()
  listaErrorAct = c()
  
  k = 0
  dx = 0
  # Imprimir estado
  cat("---------------------------------------------------------------------------\n")
  cat(formatC( c("x_k"," f(x_k)","Error est.", "Error ant."), width = -20, format = "f", flag = " "), "\n")
  cat("---------------------------------------------------------------------------\n")
  
  repeat
  {
    correccion = Fx(x0)/Gx(x0)
    x1 = x0 - correccion
    eAnterior = dx
    dx = abs(x1-x0)
    x2 = 1.63852841997036
    
    # Imprimir iteraciones
    cat(formatC( c(x1 ,Fx(x1), dx,eAnterior), digits=15, width = -15, format = "f", flag = " "), "\n")
    x0 = x1
    k = k+1
    
    if(k>1)
    {
      listaErrorAnt = c(listaErrorAnt , eAnterior)
      listaErrorAct = c(listaErrorAct, dx)
    }
    
    # until
    if(dx <= tol || k > maxiter ) break;
  }# fin del repeat
  
  
  #imprime la relación de error -> Convergencia lineal
  points(listaErrorAnt, listaErrorAct, col = "blue")
  lines(listaErrorAnt, listaErrorAct, col = "blue")
  
  
  cat("---------------------------------------------------------------------------\n")
  if(k > maxiter)
    
  {
    cat("Se alcanzó el máximo número de iteraciones.\n")
    cat("k = ", k, "Estado: x = ", x1, "Error estimado <= ", correccion)
  } else {
    cat("k = ", k, " Raíces = ", x1," y ", x2, " f(x) = ", Fx(x1), " Error estimado <= ", dx) }
}

# Función
Fx <- function(x){
  return (exp(1)^x - x - 1 )
}

# Derivada de la función
Gx <- function(x){
  return (exp(1)^x - 1)
}


plot.function(Fx, xlim=c(0,0.5), ylim=c(0,1),  main = "Relación error",xlab = " Error i ",ylab = " Error i+1 ",col ="white")
abline(h = 0, v = 0:2/2, lty = 3, col = "gray")
options(digits = 10)
Newton(Fx,Gx, 2, 1e-8, 29)

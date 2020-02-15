#derivadas
DD <- function(expr, name, order = 1) {
  if(order < 1) stop("'order' must be >= 1")
  if(order == 1) D(expr, name)
  else DD(D(expr, name), name, order - 1)
}

#funcion de taylor 
taylor = function(f, x0, a, n){ # f es tira
  # parse devuelve una expresión
  g = parse(text=f)
  # convertir en función
  fx = function(x){eval(g[[1]])}
  # almacenar los sumandos
  sumds = rep(NA, length=n+1)
  for(k in 1:n){
    g. = DD(g,"x", k)
    fp = function(x) eval(g.)
    sumds[k]=1/factorial(k)*(x0-a)^k *fp(a)
  }
  sumds[n+1] = fx(a)
  sum(sumds)
}
#respuesta
cat("El resultado de Taylor es :", round(taylor("exp(x)", 0.5, 1, 6),5),"\n")
cat("el valor de e^(0.5) es : ", round(exp(0.5),5), "\n")
cat("el erro es de : ", round(abs(round(exp(0.5),5) - round(taylor("exp(x)", 0.5, 1, 6),5)),5))


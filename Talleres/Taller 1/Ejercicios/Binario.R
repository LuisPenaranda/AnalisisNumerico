# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

binary<-function(p_number) {
  bsum<-0
  bexp<-1
  while (p_number > 0) {
    digit<-p_number %% 2
    p_number<-floor(p_number / 2)
    bsum<-bsum + digit * bexp
    bexp<-bexp * 10
  }
  
  return(bsum)
}

decimal<-function(numeroDecimal){
  
  agenteBinario = 1
  rDecimal = 0

  
  while (numeroDecimal > 0){
    multiplicando = numeroDecimal %% 2
    numeroDecimal = (numeroDecimal/10)
    numeroDecimal<-as.integer(numeroDecimal)
    rDecimal = rDecimal + (multiplicando * agenteBinario)
    agenteBinario = agenteBinario * 2
  }
  return (rDecimal)
}

#Punto A del problema 2
p_number<-as.integer(pi)
d_number = ((pi*(10^4)) - (p_number*(10^4)))
d_number<-as.integer(d_number)
bsum<-binary(p_number)
bsumk<-binary(d_number)
cat("Punto A, Binario: ", bsum, ".", bsumk)

#Punto B del problema 2
rDecimal<-decimal(10)
cat("El numero en decimal de 10 es: ", rDecimal)

rDecimal<-decimal(1010101)
cat("El numero en decimal de 1010101 es: ",rDecimal)

rDecimal<-decimal(1011)
rDecimali<-decimal(101)
cat("El numero en decimal de 1011.101 es: ",rDecimal,".",rDecimali)

rDecimal<-decimal(10111)
rDecimali<-decimal(010101)
cat("El numero en decimal de 10111.010101 es: ",rDecimal,".",rDecimali)

rDecimal<-decimal(111)
rDecimali<-decimal(1111)
cat("El numero en decimal de 111.1111 es: ",rDecimal,".",rDecimali)

#Punto C del problema 2
a_number<-as.integer(11)
b_number<-as.integer(25)
a<-binary(a_number)
b<-binary(b_number)
cat("Punto C del problema 2")
cat("El numero binario de 11.25 es: ", a,".", b)

t_number<-as.integer( (2/3)*100 )
t<-binary(t_number)
cat("El numero binario de 2/3 es: 0.", t)

a_number<-as.integer(30)
b_number<-as.integer(6)
a<-binary(a_number)
b<-binary(b_number)
cat("El numero binario de 30.6 es: ", a,".", b)

a_number<-as.integer(99)
b_number<-as.integer(9)
a<-binary(a_number)
b<-binary(b_number)
cat("El numero binario de 99.9 es: ", a,".", b)

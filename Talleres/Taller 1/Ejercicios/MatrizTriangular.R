# * Luis Peñaranda
# * Diego Gomez
# * Camilo Moreno

matrizTriangular<-function(x)
{
  sumas <-c()
  for(z in x)
  {
    
    cont = 0  
    matriz<-matrix(0,ncol=z,nrow = z)
    for(i in 1:z )
    {
      for (j in 1:i)
      {
        if(j==z)
        {
          matriz[i,j]=1
        }else{
          
          matriz[i,j]=1
        }
        
      }
      cont=cont+1
    }
    sumaf=apply(matriz,1,sum)
    value=sum(sumaf)
    sumas = c(sumas,value)
  }
  
  plot(x,sumas,xlab="Tamaño matriz",ylab="Sumas")
  lines(x,sumas, col = "blue")
}

x<-c(10,20,30,40,50,60,70,80,90, 100)
matrizTriangular(x)
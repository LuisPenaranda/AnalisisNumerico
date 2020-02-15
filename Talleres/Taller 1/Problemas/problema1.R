Error = function(maxDigitos, num){
  temp = num
  cont = 0
  #normalizar
  while(temp > 1){
    temp = temp / 10
    
    cont = cont + 1
  }
  tempTruncado = trunc(temp * 10 ^ maxDigitos) / 10 ^ maxDigitos
  result = (temp - tempTruncado) * 10^(cont - 1)
  print(result)
  
}
Error(4, 5367.8)
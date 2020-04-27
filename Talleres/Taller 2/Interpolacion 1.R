yi=c(0.1,0.12,0.23,0.41)

matriz <- matrix(c(-1,1,-1,1
                ,1,1,1,1
                ,8,4,2,1
                ,27,9,3,1), nrow=4,ncol = 4, byrow=TRUE)

polinomio<-(solve(matriz, yi))
polinomio
cat(polinomio[1],"x^3 + ", polinomio[2], "x^2 + ", polinomio[3], "x + ", polinomio[4])

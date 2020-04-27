x <- c(1, 1, 2, 2, 2)
y <- c(2, 3, 6, 7, 8)

polinomio<-c()

polinomio[1]<-y[1]
polinomio[2]<-y[2]
polinomio[3]<-(4-y[2])/(x[3]-x[1])
polinomio[4]<-((y[4]-(y[3]-y[1]))-(polinomio[3]))/(x[4]-x[1])
polinomio[5]<-((y[5]- (y[4]-(y[3]-y[1])))-(polinomio[4]))/(x[5]-x[1])

print(polinomio)
cat("P(x):",polinomio[1],"+",polinomio[2],"( x-",x[1],")+",polinomio[3],"( x-",x[2],")",x[3],"+",polinomio[4],"( x-",x[2],")",x[3],"( x-",x[3],")",polinomio[5],"( x-",x[2],")",x[4],"( x-",x[3],")",x[5])
cat("f(x) = -x^4 + 8x^3 - 20x^2 + 23x - 8")

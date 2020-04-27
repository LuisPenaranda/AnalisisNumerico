#####Lagrange
f<- function (x){exp(x)}
xi=c(1,1.5,2,3,4,5)
xi
yi=f(x)
yi
n = length(xi)
X = matrix(rep(xi, times=n), n, n, byrow=T)
X
a=2
mN = a - X ;diag(mN)= 1
mN
mD = X - t(X);  diag(mD)=1
mD
INTlagrange = function(xi,yi,a){
  n = length(xi)
  if(a < min(xi) || max(xi) < a) stop("No está interpolando")
  X = matrix(rep(xi, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(yi*Lnk)
}
xi = c( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
yi = c(0.31, 0.32, 0.33, 0.34, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5)
INTlagrange(xi[2:5],yi[2:5], 0.35)

##------ verificacion Taylor----------
library(pracma)
#grado 5
p <- taylor(f, 0, 5)
p




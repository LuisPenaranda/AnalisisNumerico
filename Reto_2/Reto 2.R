library(gridBezier)
require(grid)
library(grid)

x = BezierGrob(c(.5,.1,.1,.4),c(1.5,1.5,1,1),
               stepFn=function(...) seq(0, 1, length.out=1000))

pts1 <- BezierPoints(x)

plot(pts1$x,pts1$y,type = "l",col="red", xlim = c (0,10), ylim= c (0,10))
points(pts1$x,pts1$y,col="red")

x = BezierGrob(c(.5,.9,.9,.6),c(1.5,1.5,1,1),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts2 <- BezierPoints(x)
par(new = TRUE)
plot(pts2$x,pts2$y,type = "l",col="blue", xlim = c (0,10), ylim= c (0,10))
points(pts2$x,pts2$y,col="blue")

x = BezierGrob(c(.4,.5,.5,.6),c(1,.7,.7,1),
               stepFn=function(...) seq(0, 1, length.out=1000))

pts3 <- BezierPoints(x)

par(new = TRUE)
plot(pts3$x,pts3$y,type = "l",col="green", xlim = c (0,10), ylim= c (0,10))
points(pts3$x,pts3$y,col="green")

x = BezierGrob(c(.19,.3,.7,.81),c(1.2,.4,.4,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))

pts4 <- BezierPoints(x)

par(new = TRUE)
plot(pts4$x,pts4$y,type = "l",col="purple", xlim = c (0,10), ylim= c (0,10))
points(pts4$x,pts4$y,col="purple")


library(rgl)


open3d()

#Linea Roja 

x = c(pts1$x*100)
y = c(pts1$y*80)
z = c(500,500,500,500,500,500,500,500,500,500)
plot3d(x,y,z, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "red")
plot3d(x,y,z, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "red")


#Linea Verde

x1 = c(pts3$x*100)
y1 = c(pts3$y*80)
z1 = c(500,500,500,500,500,500,500,500,500,500)
plot3d(x1,y1,z1, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "green")
plot3d(x1,y1,z1, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "green")

x = BezierGrob(c(.409,.45,.48,.52),c(1.2,1.15,1.199,1.08),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts8 <- BezierPoints(x)
x8= c(450,450,450,450,450,450,450,450,450,450)
y8= c(pts8$x*100)
z8= c(pts8$y*70)
plot3d(x8,y8,z8, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "green")
plot3d(x8,y8,z8, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "green")


#Linea Azul 

x2 = c(pts2$x*100)
y2 = c(pts2$y*80)
z2 = c(500,500,500,500,500,500,500,500,500,500)
plot3d(x2,y2,z2, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "blue")
plot3d(x2,y2,z2, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "blue")

#volumen X vs Z

#Linea del CENTRO 
x3= c(pts4$x*100)
y3= c(600,600,600,600,600,600,600,600,600,600)
z3= c(pts4$y*70)
plot3d(x3,y3,z3, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x3,y3,z3, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

#Linea Centro atras 1 
x = BezierGrob(c(.23,.3,.7,.771),c(1.2,.45,.45,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts5 <- BezierPoints(x)
x4= c(pts5$x*100)
y4= c(650,650,650,650,650,650,650,650,650,650)
z4= c(pts5$y*70)
plot3d(x4,y4,z4, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x4,y4,z4, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


#Linea Centro atras 2 

x = BezierGrob(c(.35,.3,.7,.65),c(1.2,.6,.6,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts5 <- BezierPoints(x)
x5= c(pts5$x*100)
y5= c(700,700,700,700,700,700,700,700,700,700)
z5= c(pts5$y*70)
plot3d(x5,y5,z5, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x5,y5,z5, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

# Linea Centro adelante 1 

x = BezierGrob(c(.196,.3,.7,.805),c(1.2,.47,.47,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts6 <- BezierPoints(x)
x6= c(pts6$x*100)
y6= c(550,550,550,550,550,550,550,550,550,550)
z6= c(pts6$y*70)
plot3d(x6,y6,z6, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x6,y6,z6, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

# Linea centro adelante 2 

x = BezierGrob(c(.26,.3,.7,.75),c(1.2,.6,.6,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts7 <- BezierPoints(x)
x7= c(pts7$x*100)
y7= c(500,500,500,500,500,500,500,500,500,500)
z7= c(pts7$y*70)
plot3d(x7,y7,z7, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x7,y7,z7, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

#volumen y vs Z


##Linea central 
x = BezierGrob(c(.777,.79,.79,.79),c(.751,.9,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts8 <- BezierPoints(x)
x8= c(450,450,450,450,450,450,450,450,450,450)
y8= c(pts8$x*100)
z8= c(pts8$y*70)
plot3d(x8,y8,z8, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x8,y8,z8, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


x = BezierGrob(c(.777,.7,.65,.555),c(.751,.55,.55,.751),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts9 <- BezierPoints(x)
x9= c(450,450,450,450,450,450,450,450,450,450)
y9= c(pts9$x*100)
z9= c(pts9$y*70)
plot3d(x9,y9,z9, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x9,y9,z9, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

x = BezierGrob(c(.555,.53,.525,.52),c(.751,.791,.85,1.08),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts8 <- BezierPoints(x)
x8= c(450,450,450,450,450,450,450,450,450,450)
y8= c(pts8$x*100)
z8= c(pts8$y*70)
plot3d(x8,y8,z8, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x8,y8,z8, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


#Centro a la derecha 1

x = BezierGrob(c(.774,.78,.78,.782),c(.84,.9,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(550,550,550,550,550,550,550,550,550,550)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")



x = BezierGrob(c(.774,.7,.65,.555),c(.84,.59,.59,.80),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts11 <- BezierPoints(x)
x11= c(550,550,550,550,550,550,550,550,550,550)
y11= c(pts11$x*100)
z11= c(pts11$y*70)
plot3d(x11,y11,z11, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x11,y11,z11, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


x = BezierGrob(c(.555,.530,.527,.526),c(.805,.9,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(550,550,550,550,550,550,550,550,550,550)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


# Centro derecha 2 

x = BezierGrob(c(.745,.75,.75,.75),c(.95,.97,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(650,650,650,650,650,650,650,650,650,650)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


x = BezierGrob(c(.745,.7,.65,.555),c(.95,.8,.8,.95),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts11 <- BezierPoints(x)
x11= c(650,650,650,650,650,650,650,650,650,650)
y11= c(pts11$x*100)
z11= c(pts11$y*70)
plot3d(x11,y11,z11, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x11,y11,z11, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

x = BezierGrob(c(.555,.55,.548,.546),c(.95,.97,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(650,650,650,650,650,650,650,650,650,650)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


##Centro Izquierda 1

x = BezierGrob(c(.774,.78,.78,.782),c(.84,.9,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(350,350,350,350,350,350,350,350,350,350)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")



x = BezierGrob(c(.774,.7,.65,.555),c(.84,.59,.59,.80),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts11 <- BezierPoints(x)
x11= c(350,350,350,350,350,350,350,350,350,350)
y11= c(pts11$x*100)
z11= c(pts11$y*70)
plot3d(x11,y11,z11, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x11,y11,z11, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


x = BezierGrob(c(.555,.530,.527,.526),c(.805,.9,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(350,350,350,350,350,350,350,350,350,350)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


# Centro izquierda 2 

x = BezierGrob(c(.745,.75,.75,.75),c(.95,.97,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(250,250,250,250,250,250,250,250,250,250)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")


x = BezierGrob(c(.745,.7,.65,.555),c(.95,.8,.8,.95),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts11 <- BezierPoints(x)
x11= c(250,250,250,250,250,250,250,250,250,250)
y11= c(pts11$x*100)
z11= c(pts11$y*70)
plot3d(x11,y11,z11, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x11,y11,z11, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")

x = BezierGrob(c(.555,.55,.548,.546),c(.95,.97,1,1.2),
               stepFn=function(...) seq(0, 1, length.out=1000))
pts10 <- BezierPoints(x)
x10= c(250,250,250,250,250,250,250,250,250,250)
y10= c(pts10$x*100)
z10= c(pts10$y*70)
plot3d(x10,y10,z10, type="p", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")
plot3d(x10,y10,z10, type="l", xlim=c(0,1000),ylim=c(0,1000),zlim=c(0,1000),col = "purple")











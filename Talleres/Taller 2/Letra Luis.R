library(gridBezier)
x <- c(.4, .66, .6, .9)/3
y <- c(.285, .3, .65, .61)

x1 <- c(.9, .66, .15, .1)/3
y1 <- c(.61, .3, .67, .61)

x2 <- c(.4, .2, .94, .99)/3
y2 <- c(.285, .4, .36, .42)


grid.Bezier(x, y, gp=gpar(lwd=3))
grid.Bezier(x1, y1, gp=gpar(lwd=3))
grid.Bezier(x2, y2, gp=gpar(lwd=3))

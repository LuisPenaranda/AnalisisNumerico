library(gridBezier)
x <- c(.4, .7, .7, .4)/3
y <- c(.395, .35, .65, .61)

x1 <- c(.4, .35, .3, .3)/3
y1 <- c(.61, .6, .57, .55)

x2 <- c(.35, .33, .27, .25)/3
y2 <- c(.405, .41, .41, .4)

x3 <- c(.4, .4, .35, .35)/3
y3 <- c(.395, .395, .405, .405)

x4 <- c(.375, .41, .41, .370)/3
y4 <- c(.4, .475, .525, .6)

grid.Bezier(x, y, gp=gpar(lwd=3))
grid.Bezier(x1, y1, gp=gpar(lwd=3))
grid.Bezier(x2, y2, gp=gpar(lwd=3))
grid.Bezier(x3, y3, gp=gpar(lwd=3))
grid.Bezier(x4, y4, gp=gpar(lwd=3))


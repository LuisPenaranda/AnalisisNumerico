library(gridBezier)

x = c(.1,.3,.5,.8)/2
y = c(.4,.1,.8,.7)

x1 = c(.44,.3,.4,.8)/2
y1 = c(.5,.3,.2,.4)


grid.Bezier(x, y, gp=gpar(lwd=3))
grid.Bezier(x1, y1, gp=gpar(lwd=3))


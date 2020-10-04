setwd("C:/Users/akenn/Desktop/Code/R_Code/LU_REU/Contour_Plots/3D")
library(rgl)

#userMat = par3d(no.readonly=TRUE)$userMatrix
#            [,1]       [,2]       [,3] [,4]
# [1,] -0.6797836  0.6882809 -0.2533059    0
# [2,] -0.4930829 -0.1732299  0.8525613    0
# [3,]  0.5429214  0.7044580  0.4571385    0
# [4,]  0.0000000  0.0000000  0.0000000    1
userMat = matrix(c(-0.6797836, 0.6882809, -0.2533059, 0,
                   -0.4930829, -0.1732299, 0.8525613, 0,
                   0.5429214, 0.7044580, 0.4571385, 0,
                   0, 0, 0, 1), 4, 4, byrow = TRUE)

###############################################################################
#                                 THE LASSO                                   #
###############################################################################

# functions for the contour ball
f1 = function(x, y, C = 1.75) {
  ans = C - abs(x) - abs(y)
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75) {
  ans = -C + abs(x) + abs(y)
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "The Lasso",
       cex = 3, family = "serif")

# save to file
#rgl.snapshot(file = "3D_lasso_contour.png", fmt = "png)



###############################################################################
#                              RIDGE REGRESSION                               #
###############################################################################

# functions for the contour ball
# look into rotating this so we don't have to make n huge and make the image look nicer
f1 = function(x, y, C = 1.75) {
  #ans = C^2 - x^2 - y^2
  ans = sqrt(C^2 - x^2 - y^2)
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75) {
  #ans = -C^2 - x^2 - y^2
  ans = -sqrt(C^2 - x^2 - y^2)
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "Ridge Regression",
       cex = 3, family = "serif")

# save to file
#rgl.snapshot(file = "3D_ridge_contour.png", fmt = "png)



###############################################################################
#                               ELASTIC NET                                   #
###############################################################################

# functions for the contour ball
# does not work for a = 1 (the lasso)
f1 = function(x, y, C = 1.75, a = 0.8) {
  rat = a/(1 - a)
  ans = sqrt(C^2 - x^2 - y^2 + (rat)*(C - abs(x) - abs(y)) + (rat)^2/4) - (rat)/2
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75, a = 0.8) {
  rat = a/(1 - a)
  ans = -sqrt(C^2 - x^2 - y^2 + (rat)*(C - abs(x) - abs(y)) + (rat)^2/4) + (rat)/2
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "Elastic Net",
       cex = 3, family = "serif")

# save to file
#rgl.snapshot(file = "3D_enet_contour.png", fmt = "png)



######################################################################################
#                                    GROUP LASSO                                     #
######################################################################################

# functions for the contour ball
f1 = function(x, y, C = 1.75) {
  ans = C - sqrt(x^2 + y^2)
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75) {
  ans = -C + sqrt(x^2 + y^2)
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "Group Lasso",
       cex = 3, family = "serif")

# save to file
#rgl.snapshot(file = "3D_glasso_contour.png", fmt = "png)



######################################################################################
#                                SPARSE GROUP LASSO                                  #
######################################################################################

# functions for the contour ball
# does not work for a = 1 (the lasso)
f1 = function(x, y, C = 1.75, a = 0.8) {
  ans = C - a*(abs(x) + abs(y)) - (1- a)*sqrt(x^2 + y^2)
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75, a = 0.8) {
  ans = -C + a*(abs(x) + abs(y)) + (1- a)*sqrt(x^2 + y^2)
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "Sparse Group Lasso",
       cex = 3, family = "serif")
#text3d(x = c(-coord/3, coord/1.5, coord*0.8), cex = 3, family = "serif", 
#       text = c(expression(alpha)))

# save to file
#rgl.snapshot(file = "3D_sglasso_contour.png", fmt = "png)



######################################################################################
#                                 GENERAL Lq NORMS                                   #
######################################################################################

# functions for the contour ball
f1 = function(x, y, C = 1.75, q = 0.8) {
  ans = (C^q - abs(x)^q - abs(y)^q)^(1/q)
  return(ifelse(ans >= 0, ans, NaN))
}
f2 = function(x, y, C = 1.75, q = 0.8) {
  ans = -(C^q - abs(x)^q - abs(y)^q)^(1/q)
  return(ifelse(ans <= 0, ans, NaN))
}

# n can be increased if we want to have less of an artefact at the z = 0 plane
coord = 2.25
int = c(-coord, coord)
n = 1501

# setting the view
view3d(userMatrix = userMat, zoom = 0.45)
par3d(windowRect = c(800, 50, 800 + 800, 50 + 800))

# plotting the balls
persp3d(f1, xlim = int, ylim = int, zlim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "")
persp3d(f2, xlim = int, ylim = int, n = n,
        col = "orange", axes = FALSE, box = FALSE,
        specular = "black", xlab = "", ylab = "", zlab = "", add = TRUE)

# drawing and labeling the axis
segs = c(-coord, coord)
zsegs=c(0, 0)
segments3d(x = c(segs, zsegs, zsegs),
           y = c(zsegs, segs, zsegs),
           z = c(zsegs, zsegs, segs))
text3d(x = c(coord * 1.1, 0, 0),
       y = c(0, coord * 1.1, 0),
       z = c(0, 0, coord * 1.1),
       text=c(expression(beta[1]),
              expression(beta[2]),
              expression(beta[3])), cex = 1.75, family = "serif")

# label name
text3d(x = c(-coord/3, coord/1.5, coord), text = "Lq Norm",
       cex = 3, family = "serif")
#text3d(x = c(-coord/3, coord/1.5, coord*0.8), cex = 3, family = "serif", 
#       text = c(expression(alpha)))

# save to file
#rgl.snapshot(file = "3D_lq1_contour.png", fmt = "png)
#rgl.snapshot(file = "3D_lq2_contour.png", fmt = "png)
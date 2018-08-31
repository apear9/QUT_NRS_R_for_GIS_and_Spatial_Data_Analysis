#### This script produces basic plots of the spatial data.

# Separately

plot(meuse_pts)
plot(meuse_riv)

# Together

plot(meuse_pts)
plot(meuse_riv, add = TRUE)

# Raster only

plot(meuse_grd)

# All together

plot(meuse_grd)
plot(meuse_pts, add = TRUE)
plot(meuse_riv, add = TRUE)
#### This script checks the projection of spatial data layers and later projects them.

proj4string(meuse_pts)
crs(meuse_grd)

# Conversions between long-lat and projected coordinates

# Before projection
head(meuse_pts@coords)

# Projecting
meuse_pts_proj <- spTransform(
  meuse_pts,
  CRS("+init=epsg:28992") # Some Norwegian system
)

# After projection
head(meuse_pts_proj@coords)

# The same thing but for gridded data

meuse_grd_proj <- projectRaster(
  meuse_grd,
  crs = CRS("+init=epsg:28992")
)

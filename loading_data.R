#### This script loads the spatial data used in the workshop.

meuse_pts <- readOGR(
  dsn = "meuse_pts.shp", # The file path, with extension,
  layer = "meuse_pts" # the file name
)

meuse_riv <- readOGR(
  dsn = "meuse_riv.shp",
  layer = "meuse_riv"
)

meuse_grd <- raster("meuse_grd.tif")

# Then check classes
class(meuse_pts)
class(meuse_riv)
class(meuse_grd)
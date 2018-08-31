#### This script demonstrates the writing of files from R's memory to disk.

# For shapefiles
writeOGR(
  obj = meuse_pts_proj, # The object you want to write to file
  dsn = "meuse_prj.shp", # File path, with extension
  layer = "meuse_prj", # The file name, no extension
  driver = "ESRI Shapefile" # The file encoding
)

# For rasters
writeRaster(
  x = meuse_grd_mask_inverse, # The object to write
  filename = "meuse_mgrd.tif" # The file path, with extension
)
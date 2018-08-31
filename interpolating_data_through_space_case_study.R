#### This script is for the spatial interpolation case study.

# First make sure data are projected to map coordinates.

meuse_pts_proj <- spTransform(
  meuse_pts,
  CRS("+init=epsg:28992")
)

# Construct a prediction grid from scratch

meuse_ext <- extent(meuse_pts_proj)

meuse_grd <- raster(
  ext = meuse_ext, # define the study area
  res = 25, # The resolution of the grid, in metres
  crs = proj4string(meuse_pts_proj) # The coordinate system for the grid
)
meuse_grd[] <- 0 # Fill the grid with nonsense values

meuse_spx <- as(
  meuse_grd,
  "SpatialPixelsDataFrame"
)

# Making predictions to the grid

meuse_grd[] <- idw(
  formula = log(lead) ~ 1, # A prediction formula,
  locations = meuse_pts_proj, # The observed data
  newdata = meuse_spx, # The prediction grid
  nmax = 25, # Number of nearest neighbours to use for interpolation
  idp = 3 # The inverse distance weighting power, controls smoothness
)$var1.pred

# Reprojecting the grid to geographic coordinates

meuse_grd_geo <- projectRaster(
  meuse_grd,
  crs = proj4string(meuse_pts)
)

# Plotting to check results

plot(meuse_grd_geo, col = heat.colors(15))
plot(meuse_grd_geo, col = heat.colors(15))
plot(meuse_riv, add = TRUE)

# Plotting with the Meuse river masked out

meuse_grd_geo_mask <- mask(
  meuse_grd_geo,
  meuse_riv,
  inverse = TRUE
)

plot(meuse_grd_geo_mask, col = heat.colors(15))
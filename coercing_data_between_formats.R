#### This script coerces data between different formats.

meuse_spx <- as(
  meuse_grd, # Object to coerce
  "SpatialPixelsDataFrame" # Target of coercion
)

meuse_gdf <- as.data.frame(
  meuse_spx
)

head(meuse_gdf)


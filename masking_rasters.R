#### This script demonstrates the masking of rasters.

meuse_grd_mask <- mask(
  meuse_grd, # The raster to mask
  meuse_riv  # The mask
)

plot(meuse_grd_mask)

meuse_grd_mask_inverse <- mask(
  meuse_grd,
  meuse_riv,
  inverse = TRUE
)

plot(meuse_grd_mask_inverse)
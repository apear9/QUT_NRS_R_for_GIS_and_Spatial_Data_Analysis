#### This script is for the advanced visualisation case study

library(ggmap)

# Get approx coords for study area to pull out image from Google Maps

meuse_bbx <- bbox(meuse_grd_geo) # Extract bounding box
meuse_ctr <- rowMeans(meuse_bbx) # Find centre of box

# Get and plot Google map

meuse_map <- get_map(
  location = meuse_ctr, # centre of study area
  zoom = 14 
)

ggmap(meuse_map)

# Preprocess map elements

meuse_spx_geo <- as(
  meuse_grd_geo_mask,
  "SpatialPixelsDataFrame"
)
meuse_gdf <- as.data.frame(meuse_spx_geo)
head(meuse_gdf)

meuse_gdf$discrete <- cut(meuse_gdf$layer, 7)

# Add other map elements

ggmap(meuse_map) +
  ## The remainder of the code is constructed like normal ggplot2 code
  geom_raster(
    data = meuse_gdf,
    aes(
      x = x, 
      y = y, 
      fill = discrete
    ),
    alpha = 0.75
  ) +
  scale_fill_brewer(palette = "RdYlBu", direction = -1) +
  theme_void() +
  coord_cartesian() +
  labs(fill = "log(lead concentration)")


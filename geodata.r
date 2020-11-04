# Geodata
library(sf)
source("config.R", encoding = "UTF-8")

df <- readRDS(config$rds_name)


regions<- st_read("geodata/wuchsgebiete_2011.shp")

ggplot() + 
   geom_sf(data = regions, color = "black", fill = "cyan1") + 
   ggtitle("AOI Boundary Plot") + 
   coord_sf()

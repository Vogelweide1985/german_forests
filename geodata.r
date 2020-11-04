# Geodata
library(sf)
library(ggplot2)
source("config.R", encoding = "UTF-8")

df <- readRDS(config$rds_name)


regions<- st_read(config[["shape_path"]])

ggplot() + 
   geom_sf(data = regions, color = "black", fill = "cyan1") + 
   ggtitle("AOI Boundary Plot") + 
   coord_sf() + 
   theme(panel.background = element_rect(fill = color_bg,
                                      colour = color_bg))

         
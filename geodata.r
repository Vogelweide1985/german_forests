# Geodata
library(sf)
library(ggplot2)
source("config.R", encoding = "UTF-8")

df <- readRDS(config$rds_name)

#regions<- st_read("geodata/wg_2020.shp")
regions<- st_read(config[["shape_path"]])

# Ergänzungen der fehlenden Werte aus 2005
regions$wald_proz[is.na(regions$wald_proz)]  <- c(17, 38, 8, 32, 15)
color_visme <- colorRampPalette(config[["colors_gradient"]])
my_breaks <- seq(0,100, 20)

# Plot Wladanteile nach Wuchsgebiet
ggplot() + 
   geom_sf(data = regions, aes( fill = wald_proz), size  = 0.1) + 
   coord_sf(label_axes = "none") + 
   geom_sf_text(data = regions, aes(label = wg_bu, geometry = geometry),
                fun.geometry = st_point_on_surface, show.legend = NA,
                size = 1.5, color= config[["colors_end"]]) + 
   theme(panel.background = element_rect(fill = "white",
                                      colour = "white"),
         panel.border = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank()) +
   scale_fill_gradient(low=config[["colors_start"]],
                        high=config[["colors_map"]], breaks = my_breaks, labels = my_breaks,
                       limits = c(0,100)) + 
   labs(fill = "") 



# Plot Wladanteile nach Wuchsgebiet
ggplot() + 
   geom_sf(data = regions, aes( fill = wald_proz), size  = 0.1) + 
   coord_sf(label_axes = "none") + 
   geom_sf_text(data = regions, aes(label = wg_bu, geometry = geometry),
                fun.geometry = st_point_on_surface, show.legend = NA,
                size = 1.5, color= config[["colors_end"]]) + 
   theme(panel.background = element_rect(fill = "white",
                                         colour = "white"),
         panel.border = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank()) +
   scale_fill_gradient(low=config[["colors_start"]],
                       high=config[["colors_map"]], breaks = my_breaks, labels = my_breaks,
                       limits = c(0,100)) + 
   labs(fill = "") 
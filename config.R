
library(dplyr)
library(readxl)

library(stringr)

library(magick)
library(grid)


#hlmd seeed
set.seed(812134)

config <- list()
config[["raw_xlsx"]] <- "bwi_export2.xlsx"
config[["unintesting_cols"]] <- c("Einheit",
                                  "alle Laubbäume",
                                  "alle Nadelbäume",
                                  "alle Baumarten" )
config[["rds_name"]] <- "df_heat.rds"
config[["asset_path"]] <- "asset/SVG"
config[["output_path"]] <- "asset/output"
config[["shape_path"]] <- "geodata/wuchsgebiete_2011.shp"
  
config[["col_of_region_name"]] <- "Wuchsgebiet"
config[["colors_bg"]] <- "#F1F7FF"
config[["colors_bg_map"]] <- "#B7455B"
config[["colors_start"]] <- "#FAD78A"
config[["colors_mid"]] <- "#772424"
config[["colors_end"]] <- "#39325B"
config[["colors_gradient"]] <- c(config[["colors_start"]],
                                 config[["colors_mid"]],
                                 config[["colors_end"]])

config[["tree_files"]] <- c(6,   #Eiche
                            24,  #Buche
                            5,   #LB hoch
                            25,  #LB niedrig
                            33,  #Fichte
                            1,   #Tanne
                            19,  #Douglasie
                            35,  #Kiefer
                            10   #Lärche
                            )

# get all files and only filter relevant svgs
config[["tree_files_path"]] <- list.files(path= config$asset_path) [config$tree_files] 


#Function for drawing treemaps
tree_map <- function(trees, probs, filename, width = 4800, iterations = 1000) {
   img <- image_graph(width,width, res = 300, bg="white")
   for (i in 1: iterations) {
      grid.raster(trees[[sample(1:length(probs), 1, prob = probs)]],
                  x= runif(1, 0.05,0.95), y= runif(1, 0.05,0.95), width= 0.058)
   }
   dev.off()
   image_write(img, filename)
}
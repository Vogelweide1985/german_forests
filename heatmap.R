library(gplots)
library(ggplot2)
library(tidyr)
library(RColorBrewer)
source("config.R", encoding = "UTF-8")

color_start <- "#FAD78A"
color_mid <- "#772424"
color_end <- "#B7455B"
color_test <- "#39325B"
color_bg <- "#F1F7FF"
color_style <- c(color_start, color_mid, color_test)
#color_end <- "#39325B"

#read 
df <- readRDS(config$rds_name)

#Heatmap Stats
heat <- as.matrix(df[, -which(names(df) %in% c("Wuchsgebiet"))])

#basic
heatmap(heat, hclustfun = function(x) hclust(x, method="ward.D"),
        labRow = df$Wuchsgebiet)


#ggplot Heatmap
df_heat_long <- df %>%
   gather(df, key = "Baumart", -Wuchsgebiet)
ggplot(df_heat_long, aes(Baumart, Wuchsgebiet, fill= df)) + 
   geom_tile()




jpeg("test.jpg", bg = color_bg, width= 4000, height=4000)
color_visme <- colorRampPalette(color_style)
heatmap.2(heat, breaks = 9, col = color_visme, dendrogram = "row", sepcolor = color_bg, 
          hclustfun = function(x) hclust(x, method="ward.D"), margins = c(1,10),
          cexRow = 0.3, trace = "none", labRow = NA,  labCol = NA, tracecol = color_test, 
          key.title = NA, key.xlab = NA , key.ylab = NA,  key.ytickfun = NA )


dev.off()
windows.options(reset=TRUE)

library(purrr)
as_mapper()
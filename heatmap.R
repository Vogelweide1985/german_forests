library(gplots)
library(ggplot2)
library(tidyr)
library(RColorBrewer)
source("config.R", encoding = "UTF-8")

#color_end <- "#39325B"

#read 
df <- readRDS(config$rds_name)

#Heatmap Stats
heat <- as.matrix(df[, -which(names(df) %in% c("Wuchsgebiet"))])
#basic
heatmap(heat, hclustfun = function(x) hclust(x, method="ward.D"),
        labRow = df$Wuchsgebiet)

#heatmap2
color_visme <- colorRampPalette(config[["colors_gradient"]])
heatmap.2(heat, breaks = 9, col = color_visme, dendrogram = "row", sepcolor = color_bg, 
          hclustfun = function(x) hclust(x, method="ward.D"), margins = c(1,10),
          cexRow = 0.3, trace = "none", labRow = NA,  labCol = NA, tracecol = config[["colors_end"]], 
          key.title = NA, key.xlab = NA , key.ylab = NA,  key.ytickfun = NA )


dev.off()
windows.options(reset=TRUE)

# Anteile
round(prop.table(table(mycl))*100,1)

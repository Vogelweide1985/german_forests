library(gplots)


#read 
df <- readRDS(config$rds_name)

#Heatmap Stats
heat <- as.matrix(df[, -which(names(df) %in% c("Wuchsgebiet"))])
heatmap(heat, hclustfun = function(x) hclust(x, method="ward.D"),
        labRow = df_heat$Wuchsgebiet)


#ggplot Heatmap
df_heat_long <- df_heat %>%
   gather(df_heat, key = "Baumart", -Wuchsgebiet)
ggplot(df_heat_long, aes(Baumart, Wuchsgebiet, fill= df_heat)) + 
   geom_tile()



d <- dist(heat)
dend <- hclust(d, method = "ward.D")

heatmap.2(heat, breaks = 10, col = colorspace::sequential_hcl,
          hclustfun = function(x) hclust(x, method="ward.D"))


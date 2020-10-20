
source("config.R", encoding = "UTF-8")

df <- read_xlsx(config$raw_xlsx, skip = 5) # Read

#Preprocessing
df<- df[grep('^[0-9]', df[[ c(config$col_of_region_name)]]), # only that region with numbers
              -which(names(df) %in% config$unintesting_cols)] # only relevant cols

df[is.na(df)] <- 0 # set all na's to 0

df[[ config$col_of_region_name]] <- str_replace_all(df[[ config$col_of_region_name]], "[[:punct:]]", " ") # remove special chars
df[[ config$col_of_region_name]] <- str_replace_all(df[[ config$col_of_region_name]], # replacing Umlaute
                                                    c('ü' = 'ue', 'ï' = 'ie', 'ë' = 'ee', 'ä' = 'ae','ö' = 'oe'))
#Order Dataset by correct number
df <- df[order(as.numeric(str_extract(df[[ config$col_of_region_name]], "[0-9]+"))),] 
saveRDS(df, config$rds_name) #save clean df as rds


#Lectura de los datos
library(readr)
fencing_wc2026 <- read_csv("data-raw/world_championships_hkg26.csv")

#Guardado en el formato interno del paquete
usethis::use_data(fencing_wc2026, overwrite = TRUE)

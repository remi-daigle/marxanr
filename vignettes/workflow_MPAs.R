## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(marxanr)
# library(sf)
# library(purrr)

## ----eval=FALSE---------------------------------------------------------------
#  # if(!file.exists("../data-raw/MPA_NetworkDesign.gdb.zip")){
#  #   # download the archive
#  #   download.file("https://pacgis01.dfo-mpo.gc.ca/FGPPublic/Offshore_Ecological_Human_Use_MPA_Scotian%20Shelf/Download/MPA_NetworkDesign.gdb.zip","../data-raw/MPA_NetworkDesign.gdb.zip",timeout=300)
#  #
#  #   # unzip
#  #   unzip("../data-raw/MPA_NetworkDesign.gdb.zip")
#  #
#  #   # load select layers
#  #   layers <- sf::st_layers("../data-raw/MPA_NetworkDesign.gdb")
#  #   gdb <- purrr::map(layers$name[c(6,30,58)],function(l) st_read("../data-raw/MPA_NetworkDesign.gdb",l)) %>%
#  #     dplyr::bind_rows()
#  #
#  #
#  #   BiophysicalUnits <- st_read("MPA_NetworkDesign.gdb","BiophysicalUnits")
#  #   }


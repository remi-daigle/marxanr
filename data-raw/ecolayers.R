require(magrittr)
if(!file.exists("data-raw/MPA_NetworkDesign.gdb")){
  # download the archive
  download.file("https://pacgis01.dfo-mpo.gc.ca/FGPPublic/Offshore_Ecological_Human_Use_MPA_Scotian%20Shelf/Download/MPA_NetworkDesign.gdb.zip","data-raw/MPA_NetworkDesign.gdb.zip")

  # unzip
  unzip("data-raw/MPA_NetworkDesign.gdb.zip",exdir = "data-raw")
}

# load select layers
layers <- sf::st_layers("data-raw/MPA_NetworkDesign.gdb")


ecolayers <- purrr::map(layers$name[layers$features==1],
                        function(l) {
                          sf::st_read("data-raw/MPA_NetworkDesign.gdb",l) %>%
                            dplyr::mutate(layer = l)
                        }) %>%
  dplyr::bind_rows() %>%
  dplyr::select(layer) %>%
  st_simplify(preserveTopology = TRUE,
              dTolerance = 1000) %>%
  st_make_valid()


sf::st_geometry(ecolayers) <-  "geometry"

usethis::use_data(ecolayers, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(ecolayers)
#copy the sinew output to data/data.R and fill it out


require(magrittr)
if(!file.exists("data-raw/MPA_NetworkDesign.gdb")){
  # download the archive
  download.file("https://pacgis01.dfo-mpo.gc.ca/FGPPublic/Offshore_Ecological_Human_Use_MPA_Scotian%20Shelf/Download/MPA_NetworkDesign.gdb.zip","data-raw/MPA_NetworkDesign.gdb.zip")

  # unzip
  unzip("data-raw/MPA_NetworkDesign.gdb.zip",exdir = "data-raw")
}

# load select layers
layers <- sf::st_layers("data-raw/MPA_NetworkDesign.gdb")

sfc <- purrr::map(layers$name[layers$features==48815 ][1],
                  function(l) {
                    sf::st_read("data-raw/MPA_NetworkDesign.gdb",l) %>%
                      dplyr::mutate(id=row.names(.),
                                    layer = l)
                  }) %>%
  dplyr::bind_rows() %>%
  dplyr::select(id)

costs <- purrr::map(layers$name[layers$features==48815],
                        function(l) {
                          sf::st_read("data-raw/MPA_NetworkDesign.gdb",l) %>%
                            dplyr::mutate(id=row.names(.),
                                          layer = l)
                        }) %>%
  dplyr::bind_rows() %>%
  as.data.frame() %>%
  dplyr::group_by(id) %>%
  dplyr::summarize(WEIGHTMT = sum(WEIGHTMT)) %>%
  dplyr::ungroup() %>%
  dplyr::left_join(sfc,by="id") %>%
  dplyr::select(-id) %>%
  sf::st_as_sf()

sf::st_geometry(costs) <-  "geometry"

usethis::use_data(costs, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(costs)
#copy the sinew output to R/data.R and fill it out



require(magrittr)

#"cost" of protecting any cell
cellcost <- 10000

pu_dat <- dplyr::filter(marxanr::costs,WEIGHTMT>0) %>%
  dplyr::mutate(geometry=sf::st_centroid(geometry)) %>%
  sf::st_join(marxanr::pu,.) %>%
  as.data.frame() %>%
  dplyr::group_by(id) %>%
  dplyr::summarize(cost=dplyr::if_else(is.na(sum(WEIGHTMT)),cellcost,cellcost+sum(WEIGHTMT)),
                   status=0,
                   xloc=sf::st_coordinates(sf::st_centroid(geometry))[1,2],
                   yloc=sf::st_coordinates(sf::st_centroid(geometry))[1,1]) %>%
  dplyr::arrange(as.numeric(id))

usethis::use_data(pu_dat, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(pu_dat)
#copy the sinew output to R/data.R and fill it out

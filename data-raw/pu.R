planningarea <- dplyr::bind_rows(sf::st_make_valid(marxanr::ecolayers),marxanr::costs)

pu <- sf::st_make_grid(planningarea,
                       square=FALSE,
                       n=100) %>%
  sf::st_as_sf() %>%
  sf::st_filter(planningarea) %>%
  dplyr::mutate(id=row.names(.))

sf::st_geometry(pu) <-  "geometry"
pu <- pu[c("id","geometry")]
usethis::use_data(pu, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(pu)
#copy the sinew output to data/data.R and fill it out

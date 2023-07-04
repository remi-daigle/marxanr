require(magrittr)

# landmasses for plotting
land <- rnaturalearth::ne_countries(
  country = c("Canada",
              "United States of America",
              "Saint Pierre and Miquelon"),
  scale = 10,
  returnclass = "sf") %>%
  sf::st_crop(sf::st_buffer(sf::st_union(marxanr::pu),100000)) %>%  # cropped to 100km of the pu
  dplyr::select(name)


usethis::use_data(land, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(land)
#copy the sinew output to R/data.R and fill it out

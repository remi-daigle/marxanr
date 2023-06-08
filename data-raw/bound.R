require(magrittr)

#"cost" of protecting any cell
cellcost <- 10000

bound <- marxanr::pu %>%
  sf::st_intersects() %>%
  as.data.frame() %>%
  mutate(amount=1) %>%
  rename(id1=row.id,id2=col.id)

usethis::use_data(bound, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(bound)
#copy the sinew output to R/data.R and fill it out

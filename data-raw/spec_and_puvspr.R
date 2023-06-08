require(magrittr)

sp <- unique(marxanr::ecolayers$layer)
spec <- data.frame(id=seq(1,length(sp)),
                   prop=0.3,
                   spf=1000,
                   name=sp)

sf::sf_use_s2(FALSE)

puvspr <- marxanr::ecolayers %>%
  dplyr::right_join(spec,by=c("layer"="name")) %>%
  dplyr::rename(species=id) %>%
  sf::st_intersection(marxanr::pu %>% dplyr::rename(pu=id),.) %>%
  dplyr::mutate(int_area=sf::st_area(geometry)) %>%
  as.data.frame() %>%
  dplyr::group_by(species,pu) %>%
  dplyr::summarize(amount=as.numeric(sum(int_area))) %>%
  dplyr::arrange(as.numeric(species))
sf::sf_use_s2(TRUE)


usethis::use_data(spec, overwrite = TRUE, compress = "xz")
usethis::use_data(puvspr, overwrite = TRUE, compress = "xz")

sinew::makeOxygen(spec)
sinew::makeOxygen(puvspr)
#copy the sinew output to R/data.R and fill it out

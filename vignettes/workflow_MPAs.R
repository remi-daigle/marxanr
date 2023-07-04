## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "ragg_png"
)

## ----setup--------------------------------------------------------------------
library(marxanr)
library(ggplot2)
library(dplyr)
library(sf)

## -----------------------------------------------------------------------------
data(pu)

# landmasses for plotting
data(land)

# x and y limits to make nicer plots
xlim <- st_bbox(pu)[c(1,3)]
ylim <- st_bbox(pu)[c(2,4)]
ggcoords <- coord_sf(xlim=xlim,
           ylim=ylim)

basemap <- ggplot(land)+
  geom_sf()

basemap+
  geom_sf(data=pu)+
  ggcoords
  

## -----------------------------------------------------------------------------
data("spec")
data("puvspr")
data("pu_dat")
data("bound")

head(spec)
head(puvspr)
head(pu_dat)
head(bound)

## -----------------------------------------------------------------------------
# name for new scenario
scen <- "MPAtest"


## -----------------------------------------------------------------------------
# create a folder for a new scenario
createMarxanFolder(scen=scen,dialog = FALSE)

# download marxan if necessary
downloadMarxan(path = scen)

# write marxan files to folder
write.csv(spec,file.path(scen,"input","spec.dat"),quote = FALSE,row.names = FALSE)
write.csv(puvspr,file.path(scen,"input","puvspr.dat"),quote = FALSE,row.names = FALSE)
write.csv(pu_dat,file.path(scen,"input","pu.dat"),quote = FALSE,row.names = FALSE)
write.csv(bound,file.path(scen,"input","bound.dat"),quote = FALSE,row.names = FALSE)

# create new input parameters
input <- newParams(BLM=10^5,NUMREPS = 50L,SCENNAME = scen)
writeParams(inputdat = input,file = file.path(scen,"input.dat"))

# run marxan
runMarxan(marxanpath = scen,
          inputdatfile = "input.dat")
# unlink(scen,recursive = TRUE) # if necessary

## -----------------------------------------------------------------------------
ssoln <- read.csv(file.path(scen,"output",paste0(scen,"_ssoln.csv"))) %>%
  mutate(planning_unit = as.character(planning_unit)) %>%
  right_join(pu,by=c("planning_unit"="id")) %>% 
  st_as_sf()
basemap+
  geom_sf(data = ssoln, aes(fill=number))+
  ggcoords

best <- read.csv(file.path(scen,"output",paste0(scen,"_best.csv"))) %>%
  mutate(PUID = as.character(PUID)) %>%
  right_join(pu,by=c("PUID"="id")) %>% 
  st_as_sf()
basemap+
  geom_sf(data = best, aes(fill=SOLUTION))+
  ggcoords



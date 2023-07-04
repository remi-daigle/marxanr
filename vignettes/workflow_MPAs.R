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



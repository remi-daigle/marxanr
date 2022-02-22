
<!-- README.md is generated from README.Rmd. Please edit that file -->

# marxanr

<!-- badges: start -->

[![R-CMD-check](https://github.com/remi-daigle/marxanr/workflows/R-CMD-check/badge.svg)](https://github.com/remi-daigle/marxanr/actions)
<!-- badges: end -->

The goal of marxanr is to help users prepare input files before running
[Marxan](https://marxansolutions.org/), and interpret results in a
reproducible workflow in R. This package is under development.

## Installation

You can install the development version of marxanr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("remi-daigle/marxanr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(marxanr)

# create a folder for a new scenario
scen <- "MarxanData"
dir.create(scen)

# download marxan if necessary
downloadMarxan(path = scen)

# download example data:
temp <- tempfile()
download.file("https://github.com/Marxan-source-code/marxan/releases/download/v4.0.6/MarxanData.zip",
              destfile = temp)

unzip(temp,exdir = getwd())
unlink(temp)

# create new input parameters
input <- newParams(NUMREPS = 5L,SCENNAME = scen)
writeParams(inputdat = input,file = "input_demo.dat")

# run marxan
runMarxan(marxanpath = scen,
          inputdatfile = "input_demo.dat")

unlink(scen,recursive = TRUE)
```

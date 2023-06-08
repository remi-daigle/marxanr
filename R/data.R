#' @title costs
#' @description Sum of the fisheries landings (WEIGHTMT) from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#' @format A data frame with 48815 rows and 2 variables:
#' \describe{
#'   \item{\code{WEIGHTMT}}{double Sum of the fisheries landings}
#'   \item{\code{geometry}}{list the simple features column (sfc) describing grid cells}
#'}
#' @details R script to download/create the data is in [data-raw/costs.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/costs.R)
"costs"



#' @title ecolayers
#' @description Ecological data layers from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#' @format A data frame with 78 rows and 2 variables:
#' \describe{
#'   \item{\code{layer}}{character ecolayer id}
#'   \item{\code{geometry}}{list geometry column (sfc)}
#'}
#' @details R script to download/create the data is in [data-raw/ecolayers.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/ecolayers.R)
"ecolayers"



#' @title pu
#' @description hexagonal planning units created for marxanr package demonstrations
#' @format A data frame with 2794 rows and 2 variables:
#' \describe{
#'   \item{\code{id}}{character planning unit id}
#'   \item{\code{geometry}}{list the simple features column (sfc) describing the planning units}
#'}
#' @details R script to create the data is in [data-raw/pu.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/pu.R)
"pu"

#' @title pu_dat
#' @description The marxan formatted planning unit file (e.g. pu.dat)
#' @format A data frame with 2794 rows and 5 variables:
#' \describe{
#'   \item{\code{id}}{character the planning unit ID}
#'   \item{\code{cost}}{double the cost to protect the planning unit}
#'   \item{\code{status}}{double the planning unit status}
#'   \item{\code{xloc}}{double longitude}
#'   \item{\code{yloc}}{double latitude}
#'}
#' @details R script to create the data is in [data-raw/pu_dat.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/pu_dat.R)
"pu_dat"


#' @title spec
#' @description The marxan formatted species file (e.g. spec.dat). Data was generated using ecological data layers from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#' @format A data frame with 78 rows and 4 variables:
#' \describe{
#'   \item{\code{id}}{integer the species or conservation feature ID}
#'   \item{\code{prop}}{double the proportion to be protected}
#'   \item{\code{spf}}{double the species penalty factor}
#'   \item{\code{name}}{character the name of the species or conservation feature}
#'}
#' @details R script to create the data is in [data-raw/spec_and_puvspr.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/spec_and_puvspr.R)
"spec"


#' @title puvspr
#' @description The marxan formatted species versus planning unit file (e.g. puvspr.dat). Data was generated using ecological data layers from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#' @format A data frame with 28689 rows and 3 variables:
#' \describe{
#'   \item{\code{species}}{integer the species or conservation feature ID}
#'   \item{\code{pu}}{character the planning unit ID}
#'   \item{\code{amount}}{double the amount of the species or conservation feature present in that planning unit}
#'}
#' @details R script to create the data is in [data-raw/spec_and_puvspr.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/spec_and_puvspr.R)
"puvspr"

#' @title bound
#' @description The boundary length file (e.g. bound.dat)
#' @format A data frame with 18488 rows and 3 variables:
#' \describe{
#'   \item{\code{id1}}{integer planning unit ID}
#'   \item{\code{id2}}{integer the planning unit ID of a planning unit which neighbours the one in id1}
#'   \item{\code{amount}}{double the relative importance of including the planning unit in id2 if the one in id1 is selected. }
#'}
#' @details R script to create the data is in [data-raw/bound.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/bound.R)
"bound"

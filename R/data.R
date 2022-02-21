#' @title ecolayers
#'
#' @description Ecological data layers from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#'
#' @format A data frame with 78 rows and 2 variables:
#' \describe{
#'   \item{\code{layer}}{character the layer name}
#'   \item{\code{geometry}}{list the simple features column (sfc) describing the habitat polygons}
#'}
#' @details R script to download/create the data is in [data-raw/ecolayers.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/ecolayers.R)
#' @source \url{https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2}
"ecolayers"

#' @title costs
#' @description Sum of the fisheries landings (WEIGHTMT) from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been modified/simplified for demonstration purposes and should not be used for any other purpose.
#' @format A data frame with 48815 rows and 2 variables:
#' \describe{
#'   \item{\code{WEIGHTMT}}{double Sum of the fisheries landings}
#'   \item{\code{Shape}}{list the simple features column (sfc) describing grid cells}
#'}
#' @details R script to download/create the data is in [data-raw/costs.R](https://github.com/remi-daigle/marxanr/blob/main/data-raw/costs.R)
#' @source \url{https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2}

"costs"


#' @title pu
#' @description hexagonal planning units created for marxanr package demonstrations
#' @format A data frame with 2794 rows and 2 variables:
#' \describe{
#'   \item{\code{id}}{character planning unit ID}
#'   \item{\code{geometry}}{list the simple features column (sfc) describing the planning units}
#'}
#' @details DETAILS
"pu"

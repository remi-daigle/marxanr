#' ecolayers
#'
#' Data from [Serdynska et al. 2021](https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2) will be used in this example. These data are the available bioregional-scale ecological and human use data used to inform draft Marine Protected Area (MPA) design for the Scotian Shelf-Bay of Fundy Bioregion. Please see the [original technical report](https://publications.gc.ca/collections/collection_2021/mpo-dfo/Fs97-6-3382-eng.pdf) for further details. All spatial data has been simplified for demonstration purposes and should not be used for any other purpose.
#'
#' @format A data frame with 78 rows and 2 variables:
#' \describe{
#'   \item{\code{layer}}{character the layer name}
#'   \item{\code{geometry}}{list the simple features column (sfc)}
#'}
#' @details R script to download/create the data is in data-raw/ecolayers.R
#' @source \url{https://open.canada.ca/data/en/dataset/2d9cce9a-d634-4b49-879f-87c40c52acf2}
"ecolayers"

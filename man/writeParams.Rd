% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inputfiles.R
\name{writeParams}
\alias{writeParams}
\title{Write Marxan Input Parameter File (input.dat) to disk}
\usage{
writeParams(inputdat, file = "input.dat")
}
\arguments{
\item{inputdat}{a `marxanParams` class object to be written to disk. A `marxanParams` class object can be generated using `newParams()`}

\item{file}{a character string naming the file}
}
\description{
Write Marxan Input Parameter File (input.dat) to disk
}
\examples{
\dontrun{
inputdat <- newParams(BLM = 1000)
writeParams(inputdat,"input.dat")
}
}

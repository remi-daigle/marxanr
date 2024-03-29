% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/marxan.R
\name{runMarxan}
\alias{runMarxan}
\title{runMarxan}
\usage{
runMarxan(
  os = "win",
  marxanpath = getwd(),
  inputdatfile = file.path(marxanpath, "input.dat")
)
}
\arguments{
\item{os}{character for the operating system. Either "win" (default), "linux", "macos", or "macosM1"}

\item{marxanpath}{character string for the directory of the Marxan executable. Default is the current working directory.}

\item{inputdatfile}{character string for the file path for the Marxan input parameter file. Default is "input.dat" in the "marxanpath" directory. If there is a file that matches a relative path "inputdatfile" relative to both the user's current working directory AND the "marxanpath" directory, this function will use the file in the "marxanpath" directory.}
}
\value{
output files
}
\description{
runMarxan
}
\examples{
runMarxan
}

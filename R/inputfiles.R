#' marxanParams: class that represents the Marxan Input Paramaters
#'
#' @slot BLM numeric.
#' @slot PROP numeric.
#' @slot RANDSEED numeric.
#' @slot NUMREPS integer.
#' @slot NUMITNS integer.
#' @slot STARTTEMP numeric.
#' @slot NUMTEMP numeric.
#' @slot COSTTHRESH numeric.
#' @slot THRESHPEN1 numeric.
#' @slot THRESHPEN2 numeric.
#' @slot INPUTDIR character.
#' @slot PUNAME character.
#' @slot SPECNAME character.
#' @slot PUVSPRNAME character.
#' @slot BOUNDNAME character.
#' @slot SCENNAME character.
#' @slot SAVERUN integer.
#' @slot SAVEBEST integer.
#' @slot SAVESUMMARY integer.
#' @slot SAVESCEN integer.
#' @slot SAVETARGMET integer.
#' @slot SAVESUMSOLN integer.
#' @slot SAVEPENALTY integer.
#' @slot SAVELOG integer.
#' @slot OUTPUTDIR character.
#' @slot RUNMODE integer.
#' @slot MISSLEVEL integer.
#' @slot ITIMPTYPE integer.
#' @slot HEURTYPE integer.
#' @slot CLUMPTYPE integer.
#' @slot VERBOSITY integer.
#' @slot SAVESOLUTIONSMATRIX integer.
#'
#' @return
#' @export
#'
#' @examples
setClass("marxanParams",
         slots = c(BLM = "numeric",
                   PROP = "numeric",
                   RANDSEED = "numeric",
                   NUMREPS = "integer",

                   NUMITNS = "integer",
                   STARTTEMP = "numeric",
                   NUMTEMP = "numeric",

                   COSTTHRESH  = "numeric",
                   THRESHPEN1  = "numeric",
                   THRESHPEN2  = "numeric",

                   INPUTDIR = "character",
                   PUNAME = "character",
                   SPECNAME = "character",
                   PUVSPRNAME = "character",
                   BOUNDNAME = "character",

                   SCENNAME = "character",
                   SAVERUN = "integer",
                   SAVEBEST = "integer",
                   SAVESUMMARY = "integer",
                   SAVESCEN = "integer",
                   SAVETARGMET = "integer",
                   SAVESUMSOLN = "integer",
                   SAVEPENALTY = "integer",
                   SAVELOG = "integer",
                   OUTPUTDIR = "character",

                   RUNMODE = "integer",
                   MISSLEVEL = "integer",
                   ITIMPTYPE = "integer",
                   HEURTYPE = "integer",
                   CLUMPTYPE = "integer",
                   VERBOSITY = "integer",

                   SAVESOLUTIONSMATRIX = "integer"))

#' Create new Marxan Input Parameter File (input.dat). See the Marxan User Manual for more information:
#' Serra, N., Kockel, A., Game, E. T., Grantham H., Possingham H.P., & McGowan, J. (2020). Marxan User Manual: For Marxan version 2.43 and above. The Nature Conservancy (TNC), Arlington, Virginia, United States and Pacific Marine Analysis and Research Association (PacMARA), Victoria, British Columbia, Canada.
#'
#' @param BLM Boundary Length Modifier
#' @param PROP Proportion of planning units in initial reserve system
#' @param RANDSEED Random seed number
#' @param NUMREPS Number of repeat runs (or solutions)
#' @param NUMITNS Number of iterations for annealing
#' @param STARTTEMP Starting temperature for annealing
#' @param NUMTEMP Number of temperature decreases for annealing
#' @param COSTTHRESH Cost threshold
#' @param THRESHPEN1 Size of cost threshold penalty
#' @param THRESHPEN2 Shape of cost threshold penalty
#' @param INPUTDIR Name of folder containing input data files
#' @param PUNAME Name of Planning Unit File
#' @param SPECNAME Name of Conservation Feature File
#' @param PUVSPRNAME Name of Planning Unit versus Conservation Feature File
#' @param BOUNDNAME Name of Boundary Length File
#' @param SCENNAME Scenario name for the saved output file
#' @param SAVERUN Save each run
#' @param SAVEBEST Save the best run
#' @param SAVESUMMARY Save summary information
#' @param SAVESCEN Save scenario information
#' @param SAVETARGMET Save targets met information
#' @param SAVESUMSOLN Save summed solution information
#' @param SAVEPENALTY Save computed feature penalties
#' @param SAVELOG Save log files
#' @param OUTPUTDIR Name of the folder in which to save output files
#' @param RUNMODE Run option
#' @param MISSLEVEL Species missing proportion
#' @param ITIMPTYPE Iterative improvement
#' @param HEURTYPE Heuristic
#' @param CLUMPTYPE An integer code that sets the clumping rule. A value of 0L (default) is Partial clumps do not count– Clumps smaller than the target score nothing, 1L is Partial clumps count half– Clumps smaller than the target score half their amount, and 2L Graduated penalty– Score is proportional to the size of the clump
#' @param VERBOSITY An integer code that sets screen printing options. A value of 0L is for Silent Running – Only the title of the program is displayed, 1L is Results Only – Marxan will display which run it is up to, the basic results of each run and the total run time, 2L is General Progress – In addition to the information about each run, Marxan will display information on the data that has been read in as well as details on any conservation features whose targets and requirements are such that they cannot be adequately reserved in the system, and 3L (default) is Detailed Progress – Shows exactly where the program is up to and gives the value of the system each time the temperature changes.
#' @param SAVESOLUTIONSMATRIX An integer code to save planning units selected in for each run. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#'
#' @return A 'marxanParams' class object
#' @export
#'
#' @examples
#' # Accepting all default values
#' inputdat <- newParams()
#'
#' # Accepting all default values except BLM
#' inputdat <- newParams(BLM = 1000)
newParams <- function(BLM = 1,
                     PROP = 0.5,
                     RANDSEED = -1,
                     NUMREPS = 10L,

                     NUMITNS = 1000000L,
                     STARTTEMP = -1,
                     NUMTEMP = 10000,

                     COSTTHRESH  = 0,
                     THRESHPEN1  = 14,
                     THRESHPEN2  = 1,

                     INPUTDIR = "input",
                     PUNAME = "pu.dat",
                     SPECNAME = "spec.dat",
                     PUVSPRNAME = "puvspr.dat",
                     BOUNDNAME = "bound.dat",

                     SCENNAME = "output",
                     SAVERUN = 3L,
                     SAVEBEST = 3L,
                     SAVESUMMARY = 3L,
                     SAVESCEN = 3L,
                     SAVETARGMET = 3L,
                     SAVESUMSOLN = 3L,
                     SAVEPENALTY = 3L,
                     SAVELOG = 2L,
                     OUTPUTDIR = "output",

                     RUNMODE = 1L,
                     MISSLEVEL = 1L,
                     ITIMPTYPE = 0L,
                     HEURTYPE = -1L,
                     CLUMPTYPE = 0L,
                     VERBOSITY = 3L,

                     SAVESOLUTIONSMATRIX = 3L){
  inputdat <- methods::new('marxanParams')

  for(s in methods::slotNames(inputdat)){
    if(class(get(s))==class(methods::slot(inputdat,s))){
      methods::slot(inputdat,s) <- get(s)
    } else {
      warning(paste0("The value provided for '",s,"' is not of class: ", class(methods::slot(inputdat,s)),
                     ". Attempting to coerce."))
      methods::slot(inputdat,s) <- methods::as(get(s),class(methods::slot(inputdat,s)))
    }

  }
  return(inputdat)
}

#' Write Marxan Input Parameter File (input.dat) to disk
#'
#' @param file a character string naming the file
#' @param inpudat a `marxanParams` class object to be written to disk. A `marxanParams` class object can be generated using `newParams()`
#'
#' @export
#'
#' @examples
#' inputdat <- newParams(BLM = 1000)
#' writeParams(inputdat,"input.dat")
writeParams <- function(inpudat = marxanr::newParams(),
                        file = "input.dat"){
  if(class(inputdat)!="marxanParams") stop("The value provided for 'inputdat' is not a 'marxanParams' object. A 'marxanParams' class object can be generated using `newParams()")
  writeLines(paste0(
"This file was generated by the marxanr, ",
utils::packageVersion("marxanr"),
" package in ",
R.version$version.string,"

General Parameters
BLM ", inputdat@BLM,"
PROP ", inputdat@PROP,"
RANDSEED ", inputdat@RANDSEED,"
NUMREPS ", inputdat@NUMREPS,"

Annealing Parameters
NUMITNS ", inputdat@NUMITNS,"
STARTTEMP ", inputdat@STARTTEMP,"
NUMTEMP ", inputdat@NUMTEMP,"

Cost Threshold
COSTTHRESH  ", inputdat@COSTTHRESH,"
THRESHPEN1  ", inputdat@THRESHPEN1,"
THRESHPEN2  ", inputdat@THRESHPEN2,"

Input Files
INPUTDIR ", inputdat@INPUTDIR,"
PUNAME ", inputdat@PUNAME,"
SPECNAME ", inputdat@SPECNAME,"
PUVSPRNAME ", inputdat@PUVSPRNAME,"
BOUNDNAME ", inputdat@BOUNDNAME,"

Save Files
SCENNAME ", inputdat@SCENNAME,"
SAVERUN ", inputdat@SAVERUN,"
SAVEBEST ", inputdat@SAVEBEST,"
SAVESUMMARY ", inputdat@SAVESUMMARY,"
SAVESCEN ", inputdat@SAVESCEN,"
SAVETARGMET ", inputdat@SAVETARGMET,"
SAVESUMSOLN ", inputdat@SAVESUMSOLN,"
SAVEPENALTY ", inputdat@SAVEPENALTY,"
SAVELOG ", inputdat@SAVELOG,"
OUTPUTDIR ", inputdat@OUTPUTDIR,"

Program control.
RUNMODE ", inputdat@RUNMODE,"
MISSLEVEL ", inputdat@MISSLEVEL,"
ITIMPTYPE ", inputdat@ITIMPTYPE,"
HEURTYPE ", inputdat@HEURTYPE,"
CLUMPTYPE ", inputdat@CLUMPTYPE,"
VERBOSITY ", inputdat@VERBOSITY,"

SAVESOLUTIONSMATRIX ", inputdat@SAVESOLUTIONSMATRIX),
con=file
)
}

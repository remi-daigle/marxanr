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
                   MISSLEVEL = "numeric",
                   ITIMPTYPE = "integer",
                   HEURTYPE = "integer",
                   CLUMPTYPE = "integer",
                   VERBOSITY = "integer",

                   SAVESOLUTIONSMATRIX = "integer"))

#' Create new Marxan Input Parameter File (input.dat). See the [Marxan User Manual](https://marxansolutions.org/wp-content/uploads/2021/02/Marxan-User-Manual_2021.pdf) for more information:
#' Serra, N., Kockel, A., Game, E. T., Grantham H., Possingham H.P., & McGowan, J. (2020). Marxan User Manual: For Marxan version 2.43 and above. The Nature Conservancy (TNC), Arlington, Virginia, United States and Pacific Marine Analysis and Research Association (PacMARA), Victoria, British Columbia, Canada.
#'
#' @param BLM A numeric value for the Boundary Length Modifier. Default is 1
#' @param PROP Proportion of planning units in initial reserve system. Default is 0.5
#' @param RANDSEED Random seed number. Default is -1
#' @param NUMREPS Number (integer) of repeat runs (or solutions). Default is 10L
#' @param NUMITNS Number (integer) of iterations for annealing. Default is 1000000L
#' @param STARTTEMP A numeric value for the starting temperature for annealing. Default is -1
#' @param NUMTEMP A numeric value for the temperature decreases for annealing. Default is 10000
#' @param COSTTHRESH A numeric value for the cost threshold. Default is 0
#' @param THRESHPEN1 A numeric value for the size of cost threshold penalty. Default is 0
#' @param THRESHPEN2 A numeric value for the shape of cost threshold penalty. Default is 0
#' @param INPUTDIR A character string naming the folder containing input data files. Default is "input".
#' @param PUNAME A character string naming the Planning Unit File. Default is "pu.dat".
#' @param SPECNAME A character string naming the Conservation Feature File. Default is "spec.dat".
#' @param PUVSPRNAME A character string naming the Planning Unit versus Conservation Feature File. Default is "puvspr.dat".
#' @param BOUNDNAME A character string naming the Boundary Length File. Default is "bound.dat".
#' @param SCENNAME A character string for a scenario name appended to all the saved output files. Default is "output".
#' @param SAVERUN An integer code to save each run. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVEBEST An integer code to save the best run. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVESUMMARY An integer code to save summary information. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVESCEN An integer code to save scenario information. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVETARGMET An integer code to save targets met information. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVESUMSOLN An integer code to save summed solution information. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVEPENALTY An integer code to save computed feature penalties. A value of 0L will not save a file, 1L saves the file as .dat, 2L saves the file as .txt, and 3L (default) saves the file as .csv.
#' @param SAVELOG An integer code to save log files. A value of 0L will not save a file, 1L saves the file as .dat, 2L (default) saves the file as .txt, and 3L saves the file as .csv.
#' @param OUTPUTDIR A character string naming the folder in which to save output files. Default is "output".
#' @param RUNMODE An Integer code that sets the run option. 0L Apply Simulated Annealing followed by a Heuristic; 1L (default) Apply Simulated Annealing followed by Iterative Improvement; 2L Apply Simulated Annealing followed by a Heuristic, followed by Iterative Improvement; 3L Use only a Heuristic; 4L Use only Iterative Improvement; 5L Use a Heuristic followed by Iterative Improvement; 6L Use only Simulated Annealing
#' @param MISSLEVEL A numeric proportion representing the proportion of the target a conservation feature must reach in order for it to be reported as met. Default value is 1 (i.e. 100 \%)
#' @param ITIMPTYPE An integer code that sets the iterative improvement. 0L (default) Normal Iterative Improvement; 1L Two Step Iterative Improvement; 2L ‘Swap’ Iterative Improvement; 3L Normal Improvement followed by Two Step Iterative Improvement
#' @param HEURTYPE An integer code that sets the heuristic.0L Richness; 1L Greedy; 2L Max Rarity; 3L Best Rarity; 4L Average Rarity; 5L Sum Rarity; 6L Product Irreplaceability; 7L Summation Irreplaceability
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
                     THRESHPEN1  = 0,
                     THRESHPEN2  = 0,

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
                     MISSLEVEL = 1,
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

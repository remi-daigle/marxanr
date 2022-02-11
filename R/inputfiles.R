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

#' Create new Marxan Input Parameter File (input.dat)
#'
#' @param BLM
#' @param PROP
#' @param RANDSEED
#' @param NUMREPS
#' @param NUMITNS
#' @param STARTTEMP
#' @param NUMTEMP
#' @param COSTTHRESH
#' @param THRESHPEN1
#' @param THRESHPEN2
#' @param INPUTDIR
#' @param PUNAME
#' @param SPECNAME
#' @param PUVSPRNAME
#' @param BOUNDNAME
#' @param SCENNAME
#' @param SAVERUN
#' @param SAVEBEST
#' @param SAVESUMMARY
#' @param SAVESCEN
#' @param SAVETARGMET
#' @param SAVESUMSOLN
#' @param SAVEPENALTY
#' @param SAVELOG
#' @param OUTPUTDIR
#' @param RUNMODE
#' @param MISSLEVEL
#' @param ITIMPTYPE
#' @param HEURTYPE
#' @param CLUMPTYPE
#' @param VERBOSITY
#' @param SAVESOLUTIONSMATRIX
#'
#' @return
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
  inputdat <- new('marxanParams')

  for(s in slotNames(inputdat)){
    if(class(get(s))==class(slot(inputdat,s))){
      slot(inputdat,s) <- get(s)
    } else {
      warning(paste0("The value provided for '",s,"' is not of class: ", class(slot(inputdat,s)),
                     ". Attempting to coerce."))
      slot(inputdat,s) <- as(get(s),class(slot(inputdat,s)))
    }

  }
  return(inputdat)
}

#' Write Marxan Input Parameter File (input.dat) to disk
#'
#' @param file
#' @param inpudat
#'
#' @return
#' @export
#'
#' @examples
#' inputdat <- newParams(BLM = 1000)
#' writeParams(inputdat,"input.dat")
writeParams <- function(inpudat,file){
  writeLines(paste0(
"This file was generated by the marxanr, ",
packageVersion("marxanr"),
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

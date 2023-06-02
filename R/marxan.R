#' downloadMarxan
#'
#' Download Marxan from the releases on the [github repository](https://github.com/Marxan-source-code/marxan/releases)
#'
#' @param os character for the operating system. Either "win" (default), "linux", "macos", or "macosM1"
#' @param path character string for the destination path. Defaults to the current working directory.
#' @param ver character string for the version number. Default is "4.0.6"
#'
#' @return files
#' @export
#'
#' @examples
#' downloadMarxan(os="win")
downloadMarxan <- function(os="win",path=getwd(),ver="4.0.6"){
  temp <- tempfile()

  if(ver!="4.0.6"){
    warning("This function is only tested on v4.0.6, it may not work?")
  }

  if(os=="win"){
    os1 <- "/Marxan_x64-"
    os2 <- "-Windows.zip"
  } else if(os=="linux"){
    os1 <- "/Marxan_x64-"
    os2 <- "-Linux.zip"
  } else if(os=="macos"){
    os1 <- "/marxan-"
    os2 <- "-MacOS-10.15-x86-64"
  } else if(os=="macosM1"){
    os1 <- "/marxan-"
    os2 <- "-MacOS-11-M1.zip"
  } else{
    stop(paste(os,"is not a valid option for the os argument"))
  }

  utils::download.file(
    paste0(
      "https://github.com/Marxan-source-code/marxan/releases/download/v",
      ver,
      os1,
      ver,
      os2),
    temp)
  utils::unzip(temp,exdir = path)
  base::unlink(temp)
}

#' runMarxan
#'
#' @param os character for the operating system. Either "win" (default), "linux", "macos", or "macosM1"
#' @param marxanpath character string for the directory of the Marxan executable. Default is the current working directory.
#' @param inputdatfile character string for the file path for the Marxan input parameter file. Default is "input.dat" in the "marxanpath" directory. If there is a file that matches a relative path "inputdatfile" relative to both the user's current working directory AND the "marxanpath" directory, this function will use the file in the "marxanpath" directory.
#'
#' @return output files
#' @export
#'
#' @examples
#' runMarxan
runMarxan <- function(os="win",marxanpath=getwd(),inputdatfile=file.path(marxanpath,"input.dat")){
  # set alternate wd because the Marxan system call does not work otherwise
  old <- getwd()
  on.exit(setwd(old))
  setwd(marxanpath)

  # get correct executable based on os
  if(os=="win"){
    exec <- "Marxan_x64.exe"
  } else if(os=="linux"){
    exec <- "marxan"
    stop("This only works on Windows for now!")
  } else if(os=="macos"|os=="macosM1"){
    exec <- "marxan"
    stop("This only works on Windows for now!")
  } else{
    stop("This only works on Windows for now!")
  }

  # check files
  if(!file.exists(exec)){
    stop(paste("The Marxan executable (",
               file.path(getwd(),exec),
               ") does not exist. Verify 'os' and 'marxanpath' arguments"))
  }

  if(file.exists(inputdatfile)){
    input <- inputdatfile
  } else if(file.exists(file.path(old,inputdatfile))){
    message(paste("Interpreting 'inputdatfile' as a relative path to your current working directory:",
                  file.path(old,inputdatfile)))
    input <- file.path(old,inputdatfile)
  } else {
    stop(paste("The Marxan input parameters file (i.e. input.dat) does not exist (",
               inputdatfile,
               "). Verify the 'inputdatfile' argument"))
  }

  # run marxan
  system2(exec, args = input)
}

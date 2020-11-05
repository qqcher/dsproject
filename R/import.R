#' @title Import function
#' @description
#' \code{import} reads a given file and returns a dataframe /matrix
#'
#' @details
#' This function reads a data file from user input. In circumstances
#' where user does not input a file path, this function will prompt
#' users to choose the file. Then this function will produce a dataframe/matrix.
#'
#' @param file a file path character string
#' @param ... Additional arguments that can be passed to underlying functions,
#' @import tools haven readxl vroom
#' @export
#' @return Return a dataframe/matrix
#' @author Cher Qin <qqin@@weselayn.edu>
#' @examples
#' # df <- import("example.cvs")
#' @seealso \code{\link{read_sas}}, \code{\link{read_stata}}, \code{\link{read_spss}}, \code{\link{read_excel}}, \code{\link{vroom}}.

import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}


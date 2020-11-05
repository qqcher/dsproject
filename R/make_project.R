#' @title Make Project
#' @description
#' \code{make_project} creates a project directory and subdiretories
#'
#' @details This function creates a project directory and subdirectories such
#' as "figures", "documentation","data", "reports", and "R". It also creates
#' a README.md.
#'
#' @param project a character string, the name of the project
#' @param path a character string containing the file path where the project
#' would be created. The default is the current working directories
#' @param folders a character vector containing the name of the subdirectories
#' that will be created. The default is "figures", "documentation", "data",
#' and "reports", "R"
#' @param readme a character string of the title of the markdown file
#' @param git a boolean value indicating whether to initialize a Git repository
#' and adds important files to .gitignore. The default is set to FALSE.
#'
#' @import usethis
#' @export
#' @return no value is returned
#' @author Cher Qin <qqin@@wesleyan.edu>
#' @examples
#' # make_project("example", path = "/Desktop/example")
make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = "README.md",
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}

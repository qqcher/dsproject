#' @title Installing and Attaching Packages
#'
#' @description
#' \code{use} installs a package or attach add-on packages
#'
#' @details This function will load the namespace of the package and attach it
#' to the search list. If the package is not install, it will prompt a
#' a dialogue for user to confirm the installation.
#'
#' @param pkg a character string of the name of the package or just the name of
#' the package
#' @export
#' @return no value is returned
#'
#' @author Cher Qin <qqin@@wesleyan.edu>
#' @examples
#' # use("usethis")
#' # use(usethis)
use <- function(pkg) {
  pkg <- as.character(substitute(pkg))
  if (!suppressWarnings(require(pkg, character.only = TRUE))) {
    msg <- paste("Install package", pkg, "(y/n)? ")
    answer <- readline(msg)
    answer <- substr(tolower(trimws(answer)), 1, 1)
    if (answer == "y") {
      install.packages(pkg)
      require(pkg, character.only = TRUE)
    } else {
      msg <- paste("Package", pkg, "not loaded.")
      message(msg)
    }
  }
}

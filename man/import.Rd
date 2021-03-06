% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import.R
\name{import}
\alias{import}
\title{Import function}
\usage{
import(file, ...)
}
\arguments{
\item{file}{a file path character string}

\item{...}{Additional arguments that can be passed to underlying functions,}
}
\value{
Return a dataframe/matrix
}
\description{
\code{import} reads a given file and returns a dataframe /matrix
}
\details{
This function reads a data file from user input. In circumstances
where user does not input a file path, this function will prompt
users to choose the file. Then this function will produce a dataframe/matrix.
}
\examples{
# df <- import("example.cvs")
}
\seealso{
\code{\link{read_sas}}, \code{\link{read_stata}}, \code{\link{read_spss}}, \code{\link{read_excel}}, \code{\link{vroom}}.
}
\author{
Cher Qin \href{mailto:qqin@weselayn.edu}{qqin@weselayn.edu}
}

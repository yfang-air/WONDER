% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_WONDER_UCD_raceeth.R
\name{import_WONDER_UCD_raceeth}
\alias{import_WONDER_UCD_raceeth}
\title{import_WONDER_UCD_raceeth}
\usage{
import_WONDER_UCD_raceeth(path, ...)
}
\arguments{
\item{path}{(character)}

\item{...}{passed to [import_WONDER_UCD()]}
}
\value{
tibble
}
\description{
import_WONDER_UCD_raceeth
}
\examples{
txt_path <- system.file("extdata", "UCD", "2011-2020", "UCD-2011-2020-SFBA-ByCounty-Hispanic.txt", package = "WONDER")
import_WONDER_UCD_raceeth(txt_path)

}

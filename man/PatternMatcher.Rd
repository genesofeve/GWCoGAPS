% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/patternMatcher.R
\name{PatternMatcher}
\alias{PatternMatcher}
\title{PatternMatcher Shiny Ap}
\usage{
PatternMatcher(PBySet = NULL, out = NULL, order = NULL,
  sample.color = NULL)
}
\arguments{
\item{PBySet}{list of matched set solutions for the Pmatrix from an NMF algorithm}

\item{out}{optional name for saving output}

\item{order}{optional vector indicating order of samples for plotting. Default is NULL.}

\item{sample.color}{optional vector of colors of same lenght as colnames. Default is NULL.}
}
\value{
either an index of selected sets' contributions or the editted \code{PBySet} object
}
\description{
PatternMatcher Shiny Ap
}
\examples{
\dontrun{
PBySet <-reOrderBySet(AP)
PatternMatcher(PBySet=PBySet,out=NULL,order=NULL, sample.color=NULL)
}


}


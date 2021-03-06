% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tune_control.R
\name{tune_control}
\alias{tune_control}
\title{Execution control object for tuning}
\usage{
tune_control(store_model = FALSE, store_prediction = FALSE, ...)
}
\arguments{
\item{store_model}{(\code{logical(1)}):\cr
Store the models of the individual experiments.}

\item{store_prediction}{(\code{logical(1)}):\cr
Store the predictions of the individual experiments.}

\item{...}{:\cr
Additional arguments passed down to \code{\link[mlr3:mlr_control]{mlr3::mlr_control()}}.}
}
\value{
(list()) with options passed down to \code{\link[mlr3:benchmark]{mlr3::benchmark()}}.
}
\description{
This function is a wrapper around \code{\link[mlr3:mlr_control]{mlr3::mlr_control()}} with defaults better suited for tuning.
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Tuner.R
\name{Tuner}
\alias{Tuner}
\title{Tuner Base Class}
\description{
TunerBase.
}
\section{Usage}{
\preformatted{tuner = Tuner$new(id)
# public members
tuner$id
tuner$ff
tuner$settings
# public methods
tuner$tune()
tuner$tune_result()
}
}

\section{Arguments}{

\itemize{
\item \code{id} (\code{character(1)}):\cr
The id of the Tuner.
\item \code{ff} (\link{FitnessFunction}).
\item \code{terminator} (\link{Terminator}).
\item \code{settings} (\code{list}):\cr
The settings for the Tuner.
}
}

\section{Details}{

\itemize{
\item \code{$new()} creates a new object of class \link{Tuner}.
\item \code{id} stores an identifier for this \link{Tuner}.
\item \code{ff} stores the \link{FitnessFunction} to optimize.
\item \code{terminator} stores the \link{Terminator}.
\item \code{settings} is a list of hyperparamter settings for this \link{Tuner}.
\item \code{tune()} performs the tuning, until the budget of the \link{Terminator} in the \link{FitnessFunction} is exhausted.
\item \code{tune_result()} returns a list with 2 elements:
\itemize{
\item \code{performance} (\code{numeric()}) with the best performance.
\item \code{param_vals} (\code{numeric()}) with corresponding hyperparameters.
}
}
}

\seealso{
Other Tuner: \code{\link{TunerGridSearch}},
  \code{\link{TunerRandomSearch}}
}
\concept{Tuner}

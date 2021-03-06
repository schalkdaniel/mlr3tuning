% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TunerGridSearch.R
\name{TunerGridSearch}
\alias{TunerGridSearch}
\title{TunerGridSearch}
\description{
TunerGridSearch
}
\section{Usage}{
\preformatted{tuner = TunerGridSearch$new(ff, terminator, resolution)
}

See \link{Tuner} for a description of the interface.
}

\section{Arguments}{

\itemize{
\item \code{id} (\code{character(1)}):
The id of the Tuner.
\item \code{terminator} (\link{Terminator}):
Terminator to control the termination.
Will be triggered by the hooks of the \link{FitnessFunction}.
\item \code{resolution} (\code{integer(1)}):
Resolution of the grid.
If none is specified we will try to calculate the resolution form the Terminator.
}
}

\section{Details}{

\code{$new()} creates a new object of class \link{TunerGridSearch}.
The interface is described in \link{Tuner}.
}

\examples{
task = mlr3::mlr_tasks$get("iris")
learner = mlr3::mlr_learners$get("classif.rpart")
resampling = mlr3::mlr_resamplings$get("cv")
measures = mlr3::mlr_measures$mget("mmce")
param_set = paradox::ParamSet$new(
  params = list(
    paradox::ParamDbl$new("cp", lower = 0.001, upper = 0.1)
  )
)
ff = FitnessFunction$new(task, learner, resampling, measures, param_set)

terminator = TerminatorEvaluations$new(10)
gs = TunerGridSearch$new(ff, terminator)
gs$tune()$tune_result()
}
\seealso{
Other Tuner: \code{\link{TunerRandomSearch}},
  \code{\link{Tuner}}
}
\concept{Tuner}
\keyword{internal}

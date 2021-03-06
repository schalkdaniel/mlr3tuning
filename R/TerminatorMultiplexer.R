#' @title TerminatorMultiplexer
#'
#' @description
#' TerminatorMultiplexer takes multiple Terminators and will lead to termination as soon as one Terminator signals a termination.
#' In the future more advanced termination rules can be implemented using this Multiplexer.
#'
#' @section Usage:
#' ```
#' t = TerminatorMultiplexer$new(terminators)
#' ```
#' See [Terminator] for a description of the interface.
#'
#' @section Arguments:
#' * `terminators` (`list`):
#'   List of objects of class [Terminator].
#'
#' @section Details:
#' `$new()` creates a new object of class [TerminatorMultiplexer].
#'
#'
#' @name TerminatorMultiplexer
#' @family Terminator
#' @examples
#' t = TerminatorMultiplexer$new(list(
#'    TerminatorIterations$new(3),
#'    TerminatorEvaluations$new(10)
#' ))
#' print(t)
NULL

#' @export
#' @include Terminator.R
TerminatorMultiplexer = R6Class("TerminatorMultiplexer",
  inherit = Terminator,

  public = list(
    terminators = NULL,
    initialize = function(terminators) {
      self$terminators = assert_list(terminators, types = "Terminator")
      self$terminated = FALSE
      super$initialize(settings = list())
    },

    update_start = function(ff) {
      lapply(self$terminators, function(t) t$update_start(ff))
      self$terminated = self$terminated | some(self$terminators, "terminated")
      invisible(self)
    },

    update_end = function(ff) {
      lapply(self$terminators, function(t) t$update_end(ff))
      self$terminated = self$terminated | some(self$terminators, "terminated")
      invisible(self)
    },

    format = function() {
      paste0(map_chr(self$terminators, format), collapse = "\n")
    }
  ),

  active = list(
    remaining = function() {
      as.integer(max(min(map_dbl(self$terminators, "remaining")), 0))
    }
  )
)

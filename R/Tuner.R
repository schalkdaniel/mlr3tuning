#' @title Tuner Base Class
#'
#' @description
#' TunerBase.
#'
#' @section Usage:
#' ```
#' tuner = Tuner$new(id)
#' # public members
#' tuner$id
#' tuner$ff
#' tuner$settings
#' # public methods
#' tuner$tune()
#' tuner$tune_result()
#' ```
#'
#' @section Arguments:
#' * `id` (`character(1)`):\cr
#'   The id of the Tuner.
#' * `ff` ([FitnessFunction]).
#' * `terminator` ([Terminator]).
#' * `settings` (`list`):\cr
#'   The settings for the Tuner.
#'
#' @section Details:
#' * `$new()` creates a new object of class [Tuner].
#' * `id` stores an identifier for this [Tuner].
#' * `ff` stores the [FitnessFunction] to optimize.
#' * `terminator` stores the [Terminator].
#' * `settings` is a list of hyperparamter settings for this [Tuner].
#' * `tune()` performs the tuning, until the budget of the [Terminator] in the [FitnessFunction] is exhausted.
#' * `tune_result()` returns a list with 2 elements:
#'     - `performance` (`numeric()`) with the best performance.
#'     - `param_vals` (`numeric()`) with corresponding hyperparameters.
#' @name Tuner
#' @family Tuner
NULL

#' @export
Tuner = R6Class("Tuner",
  public = list(
    id = NULL,
    ff = NULL,
    terminator = NULL,
    settings = NULL,

    initialize = function(id, ff, terminator, settings = list()) {
      self$id = assert_string(id)
      self$ff = assert_r6(ff, "FitnessFunction")
      self$terminator = assert_r6(terminator, "Terminator")
      self$settings = assert_list(settings, names = "unique")

      ff$hooks$update_start = c(ff$hooks$update_start, list(terminator$update_start))
      ff$hooks$update_end = c(ff$hooks$update_end, list(terminator$update_end))
    },

    tune = function() {
      while (!self$terminator$terminated) {
        private$tune_step()
      }
      invisible(self)
    },

    tune_result = function() {
      measure = self$ff$measures[[1L]]
      rr = self$ff$bmr$get_best(measure)
      list(performance = rr$aggregated, param_vals = rr$learner$param_vals)
    }
  )
)

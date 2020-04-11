# auxiliar function to check the sides of a die
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'sides' must be a vector of length 6")
  }
  TRUE
}


# auxiliar function to check probabilities of the sides of a die
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}


#' @title Die object
#' @description constructor function of objects of class "die"
#' @param sides vector of die sides
#' @param prob vector with probabilities of sides
#' @return an object of class "die"
#' @seealso \code{link{toss}}
#' @export
#' @examples
#' # creating a fair die (by default)
#' die1 <- die()
#'
#' # a loaded die
#' loaded1 <- die(1:6, prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
#'
die <- function(sides = 1:6, prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)
  object <- list(
    sides = sides,
    prob = prob
  )
  class(object) <- "die"
  object
}


#' @export
print.die <- function(x, ...) {
  # print method for object of class "die"
  cat('object "die"\n\n')
  df_die <- data.frame(side = x$sides, prob = x$prob)
  print(df_die)
  invisible(x)
}


#' @rdname die
#' @param x an R object
#' @export
is.die <- function(x) {
  # check class "die"
  inherits(x, "die")
}

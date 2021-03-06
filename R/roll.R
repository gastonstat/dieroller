# auxiliar function to check 'times'
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}

# auxiliar function to roll a die
roll_die <- function(x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}


# internal constructor function for object "roll"
make_roll <- function(die, rolls) {
  object <- list(
    rolls = rolls,
    sides = die$sides,
    prob = die$prob,
    total = length(rolls))
  class(object) <- "roll"
  object
}


#' @title Roll object
#' @description main roll function
#' @param die object of class "die"
#' @param times number of times to roll the die
#' @return an object of class "roll"
#' @export
#' @examples
#' # fair die
#' die1 <- die()
#'
#' # roll a coin 5 times
#' roll5 <- roll(die1, times = 5)
roll <- function(die, times = 1) {
  rolls <- roll_die(die, times = times)
  make_roll(die, rolls)
}


#' @export
print.roll <- function(x, ...) {
  # print method for object of class "roll"
  cat('object "roll"\n\n')
  cat('$rolls\n')
  print(x$rolls)
  invisible(x)
}

#' @rdname roll
#' @param x an object \code{"roll"}
#' @param \dots further arguments ignored
#' @export
#' @examples
#' roll100 <- roll(die(), times = 100)
#' summary(roll100)
#'
summary.roll <- function(x, ...) {
  # summary method for object of class "roll"
  freqs <- table(x$rolls)
  relative_freqs <- prop.table(freqs)
  # table of frequencies
  roll_freqs <- as.data.frame(cbind(
    side = x$sides,
    count = freqs,
    prop = relative_freqs))
  obj <- list(freqs = roll_freqs)
  class(obj) <- "summary.roll"
  obj
}


#' @export
print.summary.roll <- function(x, ...) {
  # print summary method for object of class "roll"
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}


#' @export
plot.roll <- function(x, ...) {
  # plot method for objects of class "roll"
  freqs <- prop.table(table(x$rolls))
  barplot(freqs, border = NA, las = 1,
          xlab = "sides of die",
          ylab = "relative frequencies")
  title(sprintf("Frequencies in a series of %s die rolls", length(x$rolls)))
}


#' @export
"[<-.roll" <- function(x, i, value) {
  # replacement method for "roll"
  if (all(x$sides != value)) {
    stop(paste('\nreplacing value must be one of', x$sides))
  }
  if (i > length(x$rolls)) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  x
}


#' @export
"[.roll" <- function(x, i) {
  # extraction method for objects of class "roll"
  x$rolls[i]
}


#' @export
"+.roll" <- function(obj, incr) {
  # addition method for class "roll"
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament")
  }
  more_rolls <- roll_die(obj, times = incr)
  obj$rolls <- c(obj$rolls, more_rolls)
  obj$total <- length(obj$rolls)
  obj
}


#' @rdname roll
#' @param obj an R object
#' @export
is.roll <- function(obj) {
  # check class "roll"
  inherits(x, "roll")
}

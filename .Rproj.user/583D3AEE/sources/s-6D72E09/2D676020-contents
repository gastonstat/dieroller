
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Overview

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that
provides functions to simulate rolling a die.

  - `die()` creates a die object (of class `"die"`)
  - `roll()` rolls a die object, producing a `"roll"` object.
  - `plot()` method for a `"roll"` object to plot frequencies of die
    sides.
  - `summary()` method for a `"roll"` object.

## Motivation

This package has been developed to illustrate some of the concepts
behind the creation of an R package.

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools")

# install "dieroller" (without vignettes)
devtools::install_github("gastonstat/dieroller")

# install "dieroller" (with vignettes)
devtools::install_github("gastonstat/dieroller", build_vignettes = TRUE)
```

## Basic Usage

``` r
library(dieroller)

# default die
die1 <- die()
die1
#> object "die"
#> 
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# 1 roll of die1
roll(die1)
#> object "roll"
#> 
#> $rolls
#> [1] 1

# 10 rolls of die1
rolls10 <- roll(die1, times = 10)
rolls10
#> object "roll"
#> 
#> $rolls
#>  [1] 6 4 4 2 3 2 5 2 1 3

# summary
summary(rolls10)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     1  0.1
#> 2    2     3  0.3
#> 3    3     2  0.2
#> 4    4     2  0.2
#> 5    5     1  0.1
#> 6    6     1  0.1

# 100 rolls
rolls100 <- roll(die1, times = 100)

# summary
summary(rolls100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    17 0.17
#> 2    2    18 0.18
#> 3    3    20 0.20
#> 4    4    16 0.16
#> 5    5    12 0.12
#> 6    6    17 0.17
```

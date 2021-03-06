% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{makeDataFrame}
\alias{makeDataFrame}
\title{Convert tinytest results to data.frame}
\usage{
makeDataFrame(x)
}
\arguments{
\item{x}{a tinytest or tinytests object}
}
\description{
This method extends the \code{as.data.frame.tinytest} method to handle 
arbitrary attributes attached to each tinytest object. You can pass in 
the results of a single test (a tinytest object) directly or the results 
of one of the \code{run_test_*} functions (a tinytests object).
}
\examples{
# create a test file in tempdir
tests <- "
using(ttdo)

addOne <- function(x) x + 2

expect_true(addOne(0) > 0)
expect_equal(2, addOne(1))
"
testfile <- tempfile(pattern = "test_", fileext = ".R")
write(tests, testfile)

# extract testdir
testdir <- dirname(testfile)
# run all files starting with 'test' in testdir
library(tinytest)
out <- run_test_dir(testdir)
#
# convert results
dat <- makeDataFrame(out)
dat

dat2 <- makeDataFrame(expect_equal_xl(1-1, 2, useDiffObj = FALSE, name = 'subtr', pts = 1))
}

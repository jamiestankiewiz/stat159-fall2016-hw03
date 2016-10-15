#install.packages('testthat')
#library(testthat)

source("functions/regression-functions.R")

#or in this case, we will just use the mtcars data set in R
reg <- lm(mpg~disp+hp, data=mtcars)
regsum <- summary(reg)


#writing different tests to check that my functions in regression-functions.R work properly. Mostly will be checking that value works out.
context('Test for RSS')

test_that("residual_sum_squares works", {
  
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  
})

#
context('Test for TSS')

test_that("residual_sum_squares works", {
  
  expect_equal(total_sum_squares(reg), sum( (mtcars$mpg - mean(mtcars$mpg))^2 ) )
  
})

#
context('Test for RSE')

test_that("residual_std_errors works", {
  
  expect_equal(residual_std_error(reg), regsum$sigma )
  
})

#
context('Test for R^2')

test_that("r_squared works", {
  
  expect_equal(r_squared(reg), regsum$r.squared )
  
})

#
context('Test for F')

test_that("f_statistic works", {
  
  expect_equal(f_statistic(reg), as.vector(regsum$fstatistic[1]) )
  
})

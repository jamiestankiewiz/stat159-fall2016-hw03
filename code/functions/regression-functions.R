ad <- read.csv('../data/Advertising.csv')
regression <- lm(ad)

regsum <- summary(regression)


#RSS function 
residual_sum_squares <- function(lm){
  RSS <- sum(lm$residuals^2)
  RSS
}



#include comments
total_sum_squares <- function(lm){
  TSS = sum(sum((unlist(lm$model[1]) - mean(unlist(lm$model[1])))^2)) 
}


#R_squared measures the percentage of variablility in the response variables that have been accurately described by the regression.
#we elmpect the input to be a lm() function of a data set with multiple categories (multiple regression)
#we elmpect the output to be a number between 0 and 1. A value closer to 1 indicates that a big portion of the response was due to the regression.
r_squared <- function(lm){
  1 - residal_sum_squares(lm)/total_sum_squares(lm)
}


#include comments
f_statistic <- function(lm){
  p <- length(lm$coefficients) - 1
  n <- legnth(lm$fitted.values)
 Fnum <- (total_sum_squares(lm) - residual_sum_squares(lm))/p
 Fdenom <- residual_sum_squares(lm)/(n-p-1)
 Fstat <- Fnum/Fdenom
 Fstat
}


#RSE is the sd of the residuals (errors). It measures the lack of fit of the model. The smaller the value, the smaller the errors are from the predicted fit line.
#we elmpect the input to be a lm of a data set with multiple categories.
#we elmpect the output to return a value of the .....................
residual_std_error <- function(lm){
 n <- length(lm$fitted.values)
 p <- length(lm$coefficients) - 1
 RSE <- sqrt(residual_sum_squares(lm)/(n-p-1))
 RSE
 }
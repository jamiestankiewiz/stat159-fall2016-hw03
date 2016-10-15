ad <- read.csv('../data/Advertising.csv')
regression <- lm(ad)

regsum <- summary(regression)


#RSS function calculates the sum of the devidations of the y-value of the data set to the y-value of the regression line (prediction of what the y value should be).
#we expect the input to be a lm() function of a data set with multiple categories (multiple regression)
#we expect the output to be a number that retains to the sum of the squared deviations.
residual_sum_squares <- function(lm){
  RSS <- sum(lm$residuals^2)
  RSS
}



#total sum of squares calculates the sum of squared values of how far each observation is from the mean.
#we expect the input to be a lm() function of a data set with multiple categories (multiple regression)
#we expect the output to be a number of the sum of the squared difference of values of observations from the mean.
total_sum_squares <- function(lm) {
  y <- lm$model[,1]
  sum((y - mean(y))^2)
  
}


#R_squared measures the percentage of variablility in the response variables that have been accurately described by the regression.
#we expect the input to be a lm() function of a data set with multiple categories (multiple regression)
#we expect the output to be a number between 0 and 1. A value closer to 1 indicates that a big portion of the response was due to the regression.
r_squared <- function(lm){
  1 - (residual_sum_squares(lm)/total_sum_squares(lm) )
}


#The F statistic comes from the ANOVA table when doing an ANOVA test. The F statistic is the value you obtain from your data to see if multiple means are different from each other.
#we expect the input to be a lm() function of a data set with multiple categories (multiple regression)
#we expect the output to be a number corresponding to whether the means of the data are different.
f_statistic <- function(lm){
  p <- length(lm$coefficients) - 1
  n <- length(lm$fitted.values)
 Fnum <- (total_sum_squares(lm) - residual_sum_squares(lm))/p
 Fdenom <- residual_sum_squares(lm)/(n-p-1)
 Fstat <- Fnum/Fdenom
 Fstat
}


#RSE is the sd of the residuals (errors). It measures the lack of fit of the model. The smaller the value, the smaller the errors are from the predicted fit line.
#we expect the input to be a lm of a data set with multiple categories.
#we expect the output to return a value of the standard error corresponding to the residual distribution.
residual_std_error <- function(lm){
 n <- length(lm$fitted.values)
 p <- length(lm$coefficients) - 1
 RSE <- sqrt(residual_sum_squares(lm)/(n-p-1))
 RSE
}

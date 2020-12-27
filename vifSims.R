makelms <- function(x1, x2, x3){
  # Simulate a dependent variable, y, as x1
  # plus a normally distributed error of mean 0 and 
  # standard deviation .3.
  y <- x1 + rnorm(length(x1), sd = .3)
  # Find the coefficient of x1 in 3 nested linear
  # models, the first including only the predictor x1,
  # the second x1 and x2, the third x1, x2, and x3.
  c(coef(lm(y ~ x1))[2], 
    coef(lm(y ~ x1 + x2))[2], 
    coef(lm(y ~ x1 + x2 + x3))[2])
}

# Regressor generation process 1.
rgp1 <- function(){
  print("Processing. Please wait.")
  # number of samples per simulation
  n <- 100
  # number of simulations
  nosim <- 1000
  # set seed for reproducibility
  set.seed(4321)
  # Point A
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  x3 <- rnorm(n)
  # Point B
  betas <- sapply(1 : nosim, function(i)makelms(x1, x2, x3))
  round(apply(betas, 1, var), 5)
}

# Regressor generation process 2.
rgp2 <- function(){
  print("Processing. Please wait.")
  # number of samples per simulation
  n <- 100
  # number of simulations
  nosim <- 1000
  # set seed for reproducibility
  set.seed(4321)
  # Point C
  x1 <- rnorm(n)
  x2 <- x1/sqrt(2) + rnorm(n) /sqrt(2)
  x3 <- x1 * 0.95 + rnorm(n) * sqrt(1 - 0.95^2)
  # Point D
  betas <- sapply(1 : nosim, function(i)makelms(x1, x2, x3))
  round(apply(betas, 1, var), 5)
}


##notes to copy 
#In modeling, our interest lies in parsimonious, interpretable representations of the data that enhance our understanding
#| of the phenomena under study. Omitting variables results in bias in the coefficients of interest - unless their regressors
#| are uncorrelated with the omitted ones. On the other hand, including any new variables increases (actual, not estimated)
#| standard errors of other regressors. So we don't want to idly throw variables into the model. This lesson is about the
#| second of these two issues, which is known as variance inflation.

##| A variance inflation factor (VIF) is a ratio of estimated variances, the variance due to including the ith regressor,
## divided by that due to including a corresponding ideal regressor which is uncorrelated with the others. 
##A VIF describes the increase in the variance of a coefficient due to the correlation of its regressor with the other regressors.


#| The problems of variance inflation and bias due to excluded regressors both involve correlated regressors. However there
#| are methods, such as factor analysis or principal componenent analysis, which can convert regressors to an equivalent
#| uncorrelated set. 












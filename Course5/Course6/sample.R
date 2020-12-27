#res_eqn.R
#Here are the vectors of variations or tweaks
sltweak <- c(.01, .02, .03, -.01, -.02, -.03) #one for the slope
ictweak <- c(.1, .2, .3, -.1, -.2, -.3)  #one for the intercept
lhs <- numeric()
rhs <- numeric()
#left side of eqn is the sum of squares of residuals of the tweaked regression line
for (n in 1:6) lhs[n] <- sqe(ols.slope+sltweak[n],ols.ic+ictweak[n])
#right side of eqn is the sum of squares of original residuals + sum of squares of two tweaks
for (n in 1:6) rhs[n] <- sqe(ols.slope,ols.ic) + sum(est(sltweak[n],ictweak[n])^2)

#slopedemo_no_mani.R
library(UsingR)
myPlot <- function(beta){
  y <- galton$child - mean(galton$child)
  x <- galton$parent - mean(galton$parent)
  freqData <- as.data.frame(table(x, y))
  names(freqData) <- c("child", "parent", "freq")
  plot(
    as.numeric(as.vector(freqData$parent)), 
    as.numeric(as.vector(freqData$child)),
    pch = 21, col = "black", bg = "lightblue",
    cex = .15 * freqData$freq, 
    xlab = "parent", 
    ylab = "child"
  )
  abline(0, beta, lwd = 3)
  points(0, 0, cex = 2, pch = 19)
  mse <- mean( (y - beta * x)^2 )
  title(paste("beta = ", beta, "mse = ", round(mse, 3)))
}
manipulate(myPlot(beta), beta = slider(0.4, .8, step = 0.02))


#slopedemo.R
myPlot <- function(beta){
  y <- galton$child - mean(galton$child)
  x <- galton$parent - mean(galton$parent)
  freqData <- as.data.frame(table(x, y))
  names(freqData) <- c("child", "parent", "freq")
  plot(
    as.numeric(as.vector(freqData$parent)), 
    as.numeric(as.vector(freqData$child)),
    pch = 21, col = "black", bg = "lightblue",
    cex = .15 * freqData$freq, 
    xlab = "parent", 
    ylab = "child"
  )
  abline(0, beta, lwd = 3)
  points(0, 0, cex = 2, pch = 19)
  mse <- mean( (y - beta * x)^2 )
  title(paste("beta = ", beta, "mse = ", round(mse, 3)))
}
manipulate(myPlot(beta), beta = manipulate::slider(0.4, .8, step = 0.02))


#finalplot.R

#plot the original Galton data points with larger dots for more freq pts
y <- galton$child
x <- galton$parent
freqData <- as.data.frame(table(galton$child, galton$parent))
names(freqData) <- c("child", "parent", "freq")
plot(as.numeric(as.vector(freqData$parent)), 
     as.numeric(as.vector(freqData$child)), 
     pch = 21, col = "black", bg = "lightblue",
     cex = .07 * freqData$freq, xlab = "parent", ylab = "child")

#original regression line, children as outcome, parents as predictor
abline(mean(y) - mean(x) * cor(y, x) * sd(y) / sd(x), #intercept
       sd(y) / sd(x) * cor(y, x),  #slope
       lwd = 3, col = "red")

#new regression line, parents as outcome, children as predictor
abline(mean(y) - mean(x) * sd(y) / sd(x) / cor(y, x), #intercept
       sd(y) / cor(y, x) / sd(x), #slope
       lwd = 3, col = "blue")

#assume correlation is 1 so slope is ratio of std deviations
abline(mean(y) - mean(x) * sd(y) / sd(x), #intercept
       sd(y) / sd(x),  #slope
       lwd = 2)
points(mean(x), mean(y), cex = 2, pch = 19) #big point of intersection


##elimination.R
# Regress the given variable on the given predictor,
# suppressing the intercept, and return the residual.
regressOneOnOne <- function(predictor, other, dataframe){
  # Point A. Create a formula such as Girth ~ Height -1
  formula <- paste0(other, " ~ ", predictor, " - 1")
  # Use the formula in a regression and return the residual.
  resid(lm(formula, dataframe))
}

# Eliminate the specified predictor from the dataframe by
# regressing all other variables on that predictor
# and returning a data frame containing the residuals
# of those regressions.
eliminate <- function(predictor, dataframe){
  # Find the names of all columns except the predictor.
  others <- setdiff(names(dataframe), predictor)
  # Calculate the residuals of each when regressed against the given predictor
  temp <- sapply(others, function(other)regressOneOnOne(predictor, other, dataframe))
  # sapply returns a matrix of residuals; convert to a data frame and return.
  as.data.frame(temp)
}



#swissLMs.R multivariate example
makelms <- function(){
  # Store the coefficient of linear models with different independent variables
  cf <- c(coef(lm(Fertility ~ Agriculture, swiss))[2], 
          coef(lm(Fertility ~ Agriculture + Catholic,swiss))[2],
          coef(lm(Fertility ~ Agriculture + Catholic + Education,swiss))[2],
          coef(lm(Fertility ~ Agriculture + Catholic + Education + Examination,swiss))[2],
          coef(lm(Fertility ~ Agriculture + Catholic + Education + Examination +Infant.Mortality, swiss))[2])
  print(cf)
}

# Regressor generation process 1.
rgp1 <- function(){
  print("Processing. Please wait.")
  # number of samples per simulation
  n <- 100
  # number of simulations
  nosim <- 1000
  # set seed for reproducability
  set.seed(4321)
  # Point A:
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  x3 <- rnorm(n)
  # Point B:
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
  # set seed for reproducability
  set.seed(4321)
  # Point C:
  x1 <- rnorm(n)
  x2 <- x1/sqrt(2) + rnorm(n) /sqrt(2)
  x3 <- x1 * 0.95 + rnorm(n) * sqrt(1 - 0.95^2)
  # Point D:
  betas <- sapply(1 : nosim, function(i)makelms(x1, x2, x3))
  round(apply(betas, 1, var), 5)
}


##vifSims.R
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

#A variance inflation factor (VIF) is a ratio of estimated variances, the variance due to including the ith regressor,
#| divided by that due to including a corresponding ideal regressor which is uncorrelated with the others. VIF's can be
#| calculated directly, but the car package provides a convenient method for the purpose as we will illustrate using the
#| Swiss data from the datasets package.

#A VIF describes the increase in the variance of a coefficient due to the correlation of its regressor with the other
#| regressors.

#| The problems of variance inflation and bias due to excluded regressors both involve correlated regressors. However there
#| are methods, such as factor analysis or principal componenent analysis, which can convert regressors to an equivalent
#| uncorrelated set.

###fitting.R
simbias <- function(seed=8765){
  # The default seed guarantees a nice histogram. This is the only
  # reason that accepting the default, x1c <- simbias(), is required in the lesson. 
  # The effect will be evident with other seeds as well.
  set.seed(seed) 
  temp <- rnorm(100)
  # Point A
  x1 <- (temp + rnorm(100))/sqrt(2)
  x2 <- (temp + rnorm(100))/sqrt(2)
  x3 <- rnorm(100)
  # Function to simulate regression of y on 2 variables.
  f <- function(k){
    # Point B
    y <- x1 + x2 + x3 + .3*rnorm(100)
    # Point C
    c(lm(y ~ x1 + x2)$coef[2],
      lm(y ~ x1 + x3)$coef[2])
  }
  # Point D
  sapply(1:150, f)
}

# Illustrate the effect of bogus regressors on residual squared error.
bogus <- function(){
  temp <- swiss
  # Add 41 columns of random regressors to a copy of the swiss data.
  for(n in 1:41){temp[,paste0("random",n)] <- rnorm(nrow(temp))}
  # Define a function to compute the deviance of Fertility regressed
  # on all regressors up to column n. The function, deviance(model), computes
  # the residual sum of squares of the model given as its argument.
  f <- function(n){deviance(lm(Fertility ~ ., temp[,1:n]))}
  # Apply f to data from n=6, i.e., the legitimate regressors,
  # through n=47, i.e., a full complement of bogus regressors.
  rss <- sapply(6:47, f)
  # Display result.
  plot(0:41, rss, xlab="Number of bogus regressors.", ylab="Residual squared error.",
       main="Residual Squared Error for Swiss Data\nUsing Irrelevant (Bogus) Regressors",
       pch=21, bg='red')
}

# Plot histograms illustrating bias in estimates of a regressor
# coefficient 1) when an uncorrelated regressor is missing and
# 2) when a correlated regressor is missing.
x1hist <- function(x1c){
  p1 <- hist(x1c[1,], plot=FALSE)
  p2 <- hist(x1c[2,], plot=FALSE)
  yrange <- c(0, max(p1$counts, p2$counts))
  plot(p1, col=rgb(0,0,1,1/4), xlim=range(x1c), ylim=yrange, xlab="Estimated coefficient of x1",
       main="Bias Effect of Omitted Regressor")
  plot(p2, col=rgb(1,0,0,1/4), xlim=range(x1c), ylim=yrange, add=TRUE)
  legend(1.1, 40, c("Uncorrelated regressor, x3, omitted", "Correlated regressor, x2, omitted"),
         fill=c(rgb(0,0,1,1/4), rgb(1,0,0,1/4)))
}





#An F statistic is a ratio of two sums of squares divided by their respective degrees of freedom. If the two scaled sums
#| are independent and centrally chi-squared distributed with the same variance, the statistic will have an F distribution
#| with parameters given by the two degrees of freedom. In our case, the two sums are residual sums of squares which, as we
#| know, have mean zero hence are centrally chi-squared provided the residuals themselves are normally distributed. The two
#| relevant sums are given in the RSS (Residual Sum of Squares) column of the table. What are they?



#Omitting a regressor can bias estimation of the coefficient of certain other regressors - correlated regressors
#Including more regressors will reduce a model's residual sum of squares, even if the new regressors are irrelevant.

#| Frequently we care about outcomes that have two values such as alive or dead, win or lose, success or failure. Such
#| outcomes are called binary, Bernoulli, or 0/1. A collection of exchangeable binary outcomes for the same covariate data
#| are called binomial outcomes.


#A generalized linear model which has these properties supposes that the log odds of a win depend linearly on the score. That is, log(p/(1-p)) =
# b0 + b1*score. The link function, log(p/(1-p)), is called the logit, and the process of finding the best b0 and b1, is
# called logistic regression.


#Many data take the form of counts. These might be calls to a call center, number of flu cases in an area, or number of
#| cars that cross a bridge. Data may also be in the form of rates, e.g., percent of children passing a test. In this lesson
#| we will use Poisson regression to analyze daily visits to a web site as the web site's popularity grows, and to analyze
#| the percent of visits which are due to references from a different site.



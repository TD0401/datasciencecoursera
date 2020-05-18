plothist <- function(...){
  outcome <- read.csv(file.path(getwd(),"Week4Assignment/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"))
  hist(as.numeric(outcome[, 11]))
}
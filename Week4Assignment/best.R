best <- function(state_name, outcome_name){
  outcome <- read.csv(file.path(getwd(),"Week4Assignment/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"))
  state_list <- unique(outcome$State)
  if(! state_name %in% state_list ){
    stop("invalid state")
  }
  actual_id <- getOutcomeName(outcome_name)
  if(is.null(actual_id )){
    stop("invalid outcome")
  }
  
  outcome_list <- outcome[outcome$State == state_name,c(2,actual_id)]
  outcome_list[[2]] <- sapply(outcome_list[,2], as.numeric, simplify = TRUE)
  min_value <- min(outcome_list[[2]], na.rm=TRUE)
  result <- sort(outcome_list[outcome_list[[2]] == min_value,1])
  result[1]

}
getOutcomeName <- function(outcome_name){
   real_name <- if (outcome_name == "heart attack"){
      #"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
     11
   }else if(outcome_name == "heart failure"){
      #"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
     17
   }else if(outcome_name == "pneumonia"){
      #"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
     23
   }else{
     NULL
   }
     
} 
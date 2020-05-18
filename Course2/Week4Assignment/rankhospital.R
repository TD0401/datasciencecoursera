rankhospital <- function(state_name, outcome_name, rank){
  outcome <- read.csv(file.path(getwd(),"Week4Assignment/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"))
  state_list <- unique(outcome$State)
  if(! state_name %in% state_list ){
    stop("invalid state")
  }
  
  if(rank != "best" & rank!= "worst" & !is.numeric(rank)){
    stop("invalid rank")
  }

    
  actual_id = getOutcomeName(outcome_name)
  if(is.null(actual_id )){
    stop("invalid outcome")
  }
  outcome_list <- outcome[outcome$State == state_name,c(2,actual_id)]
  outcome_list[[2]] <- sapply(outcome_list[,2], as.numeric, simplify = TRUE)
  outcome_list <- outcome_list[complete.cases(outcome_list) ,]
  result <- order(outcome_list[[2]],outcome_list[[1]])
  
  if(rank == "worst"){
    outcome_list[result[length(result)],1]
  }else if(rank == "best"){
    outcome_list[result[1],1]
  }else if( is.numeric(rank) & length(result) >= as.numeric(rank)){
     outcome_list[result[as.numeric(rank)],1]
  }else {
    "NA"
  }
}
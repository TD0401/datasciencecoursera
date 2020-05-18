rankall <- function( outcome_name, rank="best"){
  outcome <- read.csv(file.path(getwd(),"Week4Assignment/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"))
  state_list <- unique(outcome$State)
  state_list <- sort(state_list)
  if(rank != "best" & rank!= "worst" & !is.numeric(rank)){
    stop("invalid rank")
  }
  df <- data.frame(hospital=c(),state =c())
  actual_id = getOutcomeName(outcome_name)
  if(is.null(actual_id )){
    stop("invalid outcome")
  }
  outcome_list <- outcome[,c(2,actual_id,7)]
  outcome_list[[2]] <- sapply(outcome_list[,2], as.numeric, simplify = TRUE)
  outcome_list <- outcome_list[complete.cases(outcome_list) ,]
  for(st in state_list){
     tempdf <- outcome_list[outcome_list[[3]] == st,]
     result <- order (tempdf[[2]] ,tempdf[[1]], tempdf[[3]])
     #tempdf <- tempdf[result[1:length(result)],c(1,2,3)]
     
     if(rank =="best"){
       df <- rbind(df,data.frame(hospital = c(tempdf[result[1],1]),state = c(st) ))
     }else if (rank == "worst"){
       df<- rbind(df,data.frame(hospital = c(tempdf[result[length(result)],1]) , state = c(st)))
     }else if (as.numeric(rank) < length(result)){
       df <- rbind(df,data.frame(hospital = tempdf[result[as.numeric(rank)],1] , state = c(st)))
     }else{
       df <- rbind(df,data.frame(hospital = "NA",state = st))
     }
   
  }
  colnames(df) <- c("hospital","state")
  class(df)
  df
}
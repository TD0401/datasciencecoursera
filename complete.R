complete <- function(directory , id= 1:332){
  num_list <- rep(0,times = length(id))
  count <- 1
  for(fileId in id){
    df <- read.csv(full_file_path(directory, fileId))
    num_list[count] <-  sum(complete.cases(df))
    count<- count +1
  }
  result <- cbind(id,num_list)
  colnames(result) <- c("id","nobs")
  result
}


full_file_path <- function (directory, fid){
  fileID <- if(fid <=9){
    paste("0","0",fid,sep="")
  }else if(fid > 9 & fid <=99){
    paste("0",fid,sep="")
  }else{
    fid
  }
  file.path(directory,paste(fileID,".csv",sep=""))
}

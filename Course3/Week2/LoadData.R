loadMySql <- function(){
  library(RMySQL)
  dbCon <- dbConnect(MySQL() , user = "genome",host="genome-mysql.cse.ucsc.edu")
  result <- dbGetQuery(dbCon, "show Databases;")
  dbDisconnect(dbCon)
  result
}

loadHD5 <- function(){
  ## some HDF5 code here
}

load_data <- function(){
  if(!file.exists("Data2.csv")){
    fileData <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","Data2.csv" , method = "curl")
  }
 df<- read.fwf("Data2.csv",
           widths= c(-1,9,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3),
           col.names=c("weel","sst1","ssta1","sst2","ssta2","sst3","ssta3","sst4","ssta4"),
           strip.white=TRUE,skip=4)

  
  head(df)
   sum(df[,4])
 
}


load_html <- function(){
  
  result <- readLines("http://biostat.jhsph.edu/~jleek/contact.html")
  nchar(result[10])
  nchar(result[20])
  nchar(result[30])
  nchar(result[100])
}
problem1 <- function(){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/Idaho.csv")){
    download.file(fileUrl ,"data/Idaho.csv",method = "curl")
  }
  df <- read.csv("data/Idaho.csv")
  strsplit(names(df),"wgtp")
}

problem23 <- function(){
  file1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/GDP.csv")){
    download.file(file1 ,"data/GDP.csv",method = "curl")
  }
  gdp <- read.csv("data/GDP.csv",skip=5, header = FALSE,nrows =231)
  colnames(gdp) <- c("countrycode","ranking","x1","name","economy","x2","x3","x4","x5","x6")
  gdp <- gdp[!is.na(gdp$ranking),]
  gdp$economy <- gsub(",","",gdp$economy)
  res <- mean(as.numeric(gdp$economy), na.rm=TRUE)
  print(res)
  gdp$name[grep("^United" , gdp$name)]
}

problem4 <- function(){
  file1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  file2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/GDP.csv")){
    download.file(file1 ,"data/GDP.csv",method = "curl")
  }
  if(!file.exists("data/Country.csv")){
    download.file(file2 ,"data/Country.csv",method = "curl")
  }
  
  gdp <- read.csv("data/GDP.csv",skip=5, header = FALSE,nrows =231)
  
  colnames(gdp) <- c("countrycode","ranking","x1","name","economy","x2","x3","x4","x5","x6")
  gdp <- gdp[!is.na(gdp$ranking),]
  country <- read.csv("data/Country.csv")
  res <-  merge(country,gdp, by.x="CountryCode",by.y="countrycode",all=FALSE )
  res <- res[!is.na(country$Special.Notes),]
  length(grep("Fiscal year end: June", country$Special.Notes))
}

problem5 <- function(){
  library(quantmod)
  amzn = getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes = index(amzn)
  library(lubridate)
  my_years <- year(ymd(sampleTimes))
  print(length(my_years[my_years==2012]))
  my_days <- weekdays(ymd(sampleTimes[grep("^2012",as.character(sampleTimes))]))
  print(length(my_days[my_days=="Monday"]))
}






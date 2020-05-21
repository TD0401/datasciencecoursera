problem1 <- function(){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/Idaho.csv")){
    download.file(fileUrl ,"data/Idaho.csv",method = "curl")
  }
  df <- read.csv("data/Idaho.csv")
  agricultureLogical <- df$ACR ==3 & df$AGS ==6
  which(agricultureLogical)
}

problem2 <- function(){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/jeff.jpg")){
    download.file(fileUrl ,"data/jeff.jpg",method = "curl")
  }
  ds <- readJPEG("data/jeff.jpg", native=TRUE)
  thirty<- quantile(ds,probs = 0.3)
  eighty <- quantile(ds,probs = 0.8)
  print(thirty)
  print(eighty)
}


problem3 <- function(){
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
   res <- arrange(res, desc(as.numeric(ranking)))
   print(res[13,"Long.Name"])
   print(dim(res))
    
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
  colnames(gdp) <- c("countrycode","ranking","x1","name","economy","x2","x3","x4","x5","x6")
  gdp <- gdp[!is.na(gdp$ranking),]
  country <- read.csv("data/Country.csv")
  res <-  merge(country,gdp, by.x="CountryCode",by.y="countrycode",all=FALSE )
  mydf<- tbl_df(res)
  #detach("package:Hmisc", unload = TRUE)
  total <- mydf %>% group_by(Income.Group) %>% summarize(avg_rank= mean(ranking)) %>% print
}


problem5 <- function(){
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
  library(Hmisc)
  r <- cut2(res$ranking,g =5)
  table(r,res$Income.Group)
  
}















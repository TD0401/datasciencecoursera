loadDataCSV <- function(){
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/Idaho.csv")){
   fileData <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","data/Idaho.csv" , method = "curl")
  }
   data <- read.csv("data/Idaho.csv")
   data <- data$VAL
   data <- data[!is.na(data)]
   length(data[data ==24])
}


loadDataXL <- function(){
 
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/NGAP.xlsx")){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    fileData <- download.file(url , "data/NGAP.xlsx",method="curl")
  }
  library(xlsx)
  dat <- read.xlsx("data/NGAP.xlsx",sheetIndex =1 , header = TRUE, rowIndex = 18:23, colIndex = 7:15)
  head(dat)
  sum(dat$Zip*dat$Ext,na.rm=T)
}

loadXML <- function() {
  library(XML)
  if(!file.exists("data")){
    dir.create("data")
  }
  if(!file.exists("data/Restaurants.xml")){
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
     fileData <- download.file(url , "data/Restaurants.xml",method="curl")
  }
  doc <- xmlTreeParse("data/Restaurants.xml", useInternal= TRUE)
  rootNode <- xmlRoot(doc)
  zips <- xpathSApply(rootNode, "//zipcode",xmlValue)
  length(zips[zips == "21231"])
}


loadDataTable <- function(){
  if(!file.exists("data")){
    dir.create("data")
  }
   if(!file.exists("data/PID.csv")){
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
     fileData <- download.file(url , "data/PID.csv",method="curl")
   }
  df <- read.csv("data/PID.csv")
  file <- tempfile()
  write.table(df , file = file, row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)
  library(data.table)
  DT <- fread(file)
  system.time({DT[, mean(pwgtp15), by = SEX]})  
  
}


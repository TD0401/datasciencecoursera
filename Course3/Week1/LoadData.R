loadDataCSV <- function(){
  if(!file.exists("Idaho.csv")){
   fileData <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","Idaho.csv" , method = "curl")
  }
   data <- read.csv("Idaho.csv")
   data <- data$VAL
   data <- data[!is.na(data)]
   length(data[data ==24])
}


loadDataXL <- function(){
  if(!file.exists("NGAP.xlsx")){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    fileData <- download.file(url , "NGAP.xlsx",method="curl")
  }
  library(xlsx)
  dat <- read.xlsx("NGAP.xlsx",sheetIndex =1 , header = TRUE, rowIndex = 18:23, colIndex = 7:15)
  head(dat)
  sum(dat$Zip*dat$Ext,na.rm=T)
}

loadXML <- function() {
  library(XML)
  if(!file.exists("Restaurants.xml")){
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
     fileData <- download.file(url , "Restaurants.xml",method="curl")
  }
  doc <- xmlTreeParse("Restaurants.xml", useInternal= TRUE)
  rootNode <- xmlRoot(doc)
  zips <- xpathSApply(rootNode, "//zipcode",xmlValue)
  length(zips[zips == "21231"])
}


loadDataTable <- function(){
   if(!file.exists("PID.csv")){
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
     fileData <- download.file(url , "PID.csv",method="curl")
   }
  df <- read.csv("PID.csv")
  file <- tempfile()
  write.table(df , file = file, row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)
  library(data.table)
  DT <- fread(file)
  system.time({DT[, mean(pwgtp15), by = SEX]})  
  
}


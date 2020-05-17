pollutantmean <- function (directory , pollutant , id = 1:332){
    sum <- 0 
    len <- 0
    for(fileId in id){
        df <- read.csv(full_file_path(directory, fileId))
        df_pollutant <- df[pollutant]
        df_pollutant <- df_pollutant[!is.na(df_pollutant)]
        sum <- sum + sum(df_pollutant)
        len <- len + length(df_pollutant)
    }
    sum/len
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

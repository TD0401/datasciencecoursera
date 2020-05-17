corr <- function(directory, threshold=0){
  file_names <- list.files(directory)
  cor_vect <- c()
  for(file_name in file_names){
    df <- read.csv(file.path(directory,file_name))
    if(sum(complete.cases(df)) > threshold){
      c <- cor(df["nitrate"],df["sulfate"], use="complete.obs")
      cor_vect <- append(cor_vect,c)
    }
  }
  cor_vect
}


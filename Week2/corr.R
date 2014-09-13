corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ids_nob <- complete(directory, 1:332) 
  good_ids_nob <- ids_nob[ids_nob$nobs > threshold,]
 
  ## read data only from good files
  result <- c()
  for (n in good_ids_nob$id) {
   data <- read.csv(paste(directory,sprintf("%03.0f.csv",n),sep="/"));
   good_data <- data[complete.cases(data),]
   corrs <- cor(good_data$sulfate, good_data$nitrate) 
   result <- c(result, corrs)
  }
 
  result
}
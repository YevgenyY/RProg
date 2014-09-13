complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  idv <- vector()
  countsv <- vector()
  for (n in id) {
    ## print(paste(directory,sprintf("%03.0f.csv",n),sep="/")) 
    data <- read.csv(paste(directory,sprintf("%03.0f.csv",n),sep="/"));
    idv <- c(idv,n)
    good <- data[complete.cases(data),]
    countsv <- c(countsv, nrow(good))
  }
  
  data.frame(id = idv, nobs = countsv)
}
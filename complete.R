# Write a function that reads a directory full of files and 
# reports the number of completely observed cases in each data file. 
# The function should return a data frame where the first column is the name 
# of the file and the second column is the number of complete cases

#dr <- setwd("C:/nitin/R-Programing/coursera/exercises/Programing-in-R/datasets/specdata")

complete <- function(directory=dr , id= 1:332){

    files <- list.files()
    
    ##intialize data frame
    df <- data.frame()
    df_sum <-data.frame()
    
    ##capture the data
    
    for ( f in files){
        df <- rbind(df,read.csv(f,stringsAsFactors = F ) )
    }
    
    ## find summary of all rows which have data
    
    for (i in id){
        sm <- sum(complete.cases(df[df$ID==i,]))
        df_sum <- rbind(df_sum , c(i,sm))
    }
    names(df_sum) <- c("id","nobs")
    
    df_sum

}

#complete( id = 30:25 )
#complete( id = 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

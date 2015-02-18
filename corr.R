corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations

        ##First - Create an empty data frame to hold incoming data
        colClasses = c("Date","numeric","numeric","integer")
        col.names = c("Date","sulfate","nitrate","ID")
        poldata <- read.table(text = "",
                              colClasses = colClasses,
                              col.names = col.names)
        ## create the corresults numeric vector
        corresults <- vector("numeric",length =0)
        
        ## Next - import each file, making, and filtering out sensors
        ## that don't meet the threshold and then correlatng
        
        for (i in 1:332){
                ## get the file name
                filepath<- paste(directory,"\\",
                                 formatC(i,width=3,flag = "0"),
                                 ".csv", sep = "")
                
                ## grab the data
                newdata <- read.csv(filepath, header = T)
                
                ##Check the data to see if it has enough complete cases
                if(sum(complete.cases(newdata))>=threshold ) {
                        ## it does, so we correlte and row bind (append) results
                        corresults<- c(corresults,
                                       cor(newdata$sulfate,
                                       newdata$nitrate,
                                       use = "pairwise.complete.obs"))
                }
        }
        ## home stretch - just need to check for zero rows correlated
        if (length(corresults) ==0) {numeric()} else {
        corresults}
        
}
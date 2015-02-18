pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## Create an empty data frame to hold incoming data
        colClasses = c("Date","numeric","numeric","integer")
        col.names = c("Date","sulfate","nitrate","ID")
        poldata <- read.table(text = "",
                              colClasses = colClasses,
                              col.names = col.names)
        
        
        ##Lonny working his file loop - first lets get the right data in there
        for (i in id){
                ## get the file name
                filepath<- paste(directory,"\\",
                                 formatC(i,width=3,flag = "0"),
                                 ".csv", sep = "")
                                
                ## grab the data
                newdata <- read.csv(filepath, header = T)
                ## row bind (append) the data
                poldata <- rbind(poldata,newdata)        
        }
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## I think I can do all this in one row
        ## first subset is to filter the correct row
        ## second subset is to filter out the NA rows
        mean(poldata[pollutant][!is.na(poldata[pollutant])])
}

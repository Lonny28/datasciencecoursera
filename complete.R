complete <- function(directory, id = 1:332) {
                
        ## Create an empty data frame to hold incoming data
        colClasses = c("Date","numeric","numeric","integer")
        col.names = c("Date","sulfate","nitrate","ID")
        poldata <- read.table(text = "",
                              colClasses = colClasses,
                              col.names = col.names)
        
        ## Create an empty data frame to hold outgoing data
        idnobs <- read.table(text="", colClasses = c("integer","integer"),
                                        col.names = c("id","nobs"))
        
        ##Lonny's file loop to get the data into poldata
        for (i in id){
                ## get the file name
                filepath<- paste(directory,"\\",
                                 formatC(i,width=3,flag = "0"),
                                 ".csv", sep = "")
                ## grab the data
                newdata <- read.csv(filepath, header = T)
                
                ## get complete cases in newdata
                cc<- complete.cases(newdata)
                ## this removes all NA rows from newdata
                newdata<- newdata[cc,]
                
                newrow <- c(newdata[1,4],nrow(newdata))
                
                ## row bind (append) the data
                idnobs <- rbind(idnobs,newrow)        
        }
        ## my column names didn't work, so we'll do it again here
        names(idnobs) <- c("id","nobs")
        ## finally - return my value
        idnobs        
}
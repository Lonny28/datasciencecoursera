add2 <-function(x,y) {
    x+y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function (x,n = 10) {
  use <-x > n
  x[use]
}

 columnmean <- function(y, removeNA = TRUE) {
   nc <-ncol(y)
   means <- numeric(nc)
   for(i in 1:nc){
     means[i] <- mean (y[,i], na.rm = removeNA)
   }
   means
 }

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}


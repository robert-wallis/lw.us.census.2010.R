require(stringr)
# current working directory should have folders for states in it
# as if you unipped the state folder in the current directory
# state = two letter state code
# file.id = number of the file (we'll add the zeroes)
census.file <- function(state, file.id, year="2010", ...) {
  file.id <- str_pad(file.id, 5, pad="0")
  # generate filename like wa2010.sf1/wageo.sf1
  filename <- paste(tolower(state), year, ".sf1/", tolower(state), file.id, year, ".sf1", sep="")
  
  col.names <- c("fileid", "stusab", "chariter", "cifsn", "logrecno")
  # figure out how long the columns are and generate names after the above list
  line <- scan(filename, what='character', n=1, quiet=TRUE)
  l <- length(strsplit(line, ",")[[1]])
  col.nums <- sapply((length( col.names ) + 1) : l, function(x){ paste("V", x, sep="") })
  col.names <- append(col.names, col.nums)
  
  read.csv(filename, header=FALSE, col.names=col.names, ...)
}
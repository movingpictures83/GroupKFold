library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   tsvfile <<- paste(pfix, parameters["tsvfile", 2], sep="/")

   myData <<- read.table(tsvfile)
   myK <<- as.numeric(parameters["k", 2])
}

run <- function() {}

output <- function(outputfile) {
folds <- groupKFold(t(myData), k = myK) 
print(folds)
}


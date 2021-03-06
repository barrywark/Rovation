### Here is an example of some basic Ovation usage from R

## Load the Rovation library
library('Rovation')

## Open a DataContext
# Replace <connection string> with the connection string for your Ovation database
# Replace <user name> with your Ovation database user name
context <- NewDataContext('<connection string>, '<user name>')

## Get top-level objects from context.
# Note that rJava (the R-Java bridge) uses $ instead of . to represent method calls.
# So context.getProjects() in Java becomes context$getProjects() in R.
projs <- context$getProjects()
projs[[1]]$getPurpose()

## Plot a response
# You can use as.list to convert a Java array to an R array
exps<-as.list(projs[[1]]$getExperiments())
epochs <- as.list(exps[[1]]$getEpochsIterable())
epochs[[1]]
responses <- as.list(epochs[[1]]$getResponseIterable())
rData <- as.list(responses[[1]]$getFloatingPointData())
plot(seq(1,length(rData)),rData)


## Run a query and iterate the result
# Because next is an R keyword, use the nextJavaIt method in Rovation to get the next object
# from an iterator
itr <- context$query(editQuery())
while(itr$hasNext())
	epoch <- iteratorNext(itr)
end

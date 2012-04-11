### Here is an example of some basic Ovation usage from R

## Load the Rovation library
library('Rovation')

## Open a DataContext
ctx <- newDataContext('<connection file>, '<user name>')

## Get top-level objects from ctx.
# Note that rJava (the R-Java bridge) uses $ instead of . to represent method calls.
# So ctx.getProjects() in Java becomes ctx$getProjects() in R.

projs <- ctx$getProjects()
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
itr <- ctx$query('Epoch', 'true')
while(itr$hasNext())
	epoch <- nextJavaIt(itr)
end

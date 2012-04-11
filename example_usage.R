### Here is an example of some basic Ovation usage from R

## Load the Rovation library
library('Rovation')

## Open a DataContext
ctx <- newDataContext('<connection file>, '<usern ame>')

## Get top-level objects from ctx.
# Note that rJava (the R-Java bridge) uses $ instead of . to represent method calls.
# So ctx.getProjects() in Java becomes ctx$getProjects() in R.

projs <- ctx$getProjects()
projs[[1]]$getPurpose()

exps<-as.list(projs[[1]]$getExperiments())
epochs <- as.list(exps[[1]]$getEpochsIterable())
epochs[[1]]
responses <- as.list(epochs[[1]]$getResponseIterable())
rData <- as.list(responses[[1]]$getFloatingPointData())
plot(seq(1,10000),rData)


itr <- ctx$query('Epoch', 'true')
while(itr$hasNext())
	epoch <- nextJavaIt(itr)
end

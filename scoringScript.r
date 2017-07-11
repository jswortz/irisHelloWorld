library(e1071)

# load up the training data 
# TODO: THis will be repalced with SQL Server data

test <- read.table("irisAzure/testingdata.csv", header=TRUE, sep = ',')


# load the serialized model
svm_model <- readRDS("irisAzure/svm_model")

predictions <- predict(svm_model,test)

predData <- cbind(test,predictions)

# TODO: write to sql server using RODBC
# Future use R services in SQL Serve

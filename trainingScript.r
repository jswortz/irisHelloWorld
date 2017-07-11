library("e1071")
data <- iris

# Split the data
set.seed(123)
sample <- sample.int(n = nrow(data), size = floor(.75*nrow(data)), replace = F)
train <- data[sample, ]
test  <- data[-sample, ]


# OK now we save the data for later use

write.table(train, file="irisAzure/trainingdata.csv", sep=',', row.names = FALSE)
write.table(test, file="irisAzure/testingdata.csv", sep=',', row.names = FALSE)

# Create model
svm_model <- svm(Species ~ ., data=iris)
summary(svm_model)

# serialize the model object - 
# reference http://www.fromthebottomoftheheap.net/2012/04/01/saving-and-loading-r-objects/

saveRDS(svm_model, "irisAzure/svm_model")

# Done, now to make the scoring code

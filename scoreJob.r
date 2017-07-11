library(e1071)
library(RODBC)

dbhandle <- odbcDriverConnect('Driver={ODBC Driver 13 for SQL Server};Server=tcp:datasciencewmp.database.windows.net,1433;Database=irisHelloWorld;Uid=ds_admin@datasciencewmp;Pwd=Welcome1;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;')
res <- sqlQuery(dbhandle, 'select * from input_records')

svmModel <- readRDS('/rStuff/svm_model')


colnames(res) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

res <- subset(res, select = -c(Species))

Prediction <- predict(svmModel, res)
final <- cbind(res,Prediction)

colnames(final) <- c("Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width", "Prediction")

sqlSave(dbhandle, final, tablename ="output_records",rownames=FALSE, append = TRUE)
if(!require("dplyr")){
  install.packages("dplyr")
}
library(dplyr)


setwd("~/Coursera/UCI HAR Dataset/")
feature <- read.table("features.txt",header = FALSE)

setwd("test")
stest <- read.table("subject_test.txt",header = FALSE)
xtest <- read.table("X_test.txt",header = FALSE)
ytest <- read.table("y_test.txt",header = FALSE)

setwd("~/Coursera/UCI HAR Dataset/")
setwd("train")

strain  <- read.table("subject_train.txt",header = FALSE)
xtrain <- read.table("X_train.txt",header = FALSE)
ytrain  <- read.table("y_train.txt",header = FALSE)

sall <- rbind(stest,strain)
yall <- rbind(ytest,ytrain)
xall <- rbind(xtest,xtrain)

rm(xtest,xtrain,ytest,ytrain,stest,strain)

colnames(sall) <- "subject_id"
colnames(yall) <- "activity"
feature <- as.character(feature$V2)
colnames(xall) <- feature
data <- cbind(sall,yall,xall)

data <- data.frame(data)
data <- tbl_df(data)

data$activity[data$activity == 1] <- "Walking"
data$activity[data$activity == 2] <- "Walking_Upstairs"
data$activity[data$activity == 3] <- "Walking_Downstairs"
data$activity[data$activity == 4] <- "Sitting"
data$activity[data$activity == 5] <- "Standing"
data$activity[data$activity == 6] <- "Laying"


data <- select(data,1:2,contains("mean"),contains("std"))

tidydata <- group_by(data,subject_id,activity)
tidydata <- summarise_each(tidydata,funs(mean))



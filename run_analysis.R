#import labels
features <-read.table("features.txt", header=F)
#choose required labels
features_2 <- grep("mean\\(|std\\(", features[,2])
activity = read.table("activity_labels.txt",header=FALSE, col.names=c('activity_ID','activityType'))

#load sets for training dataset
xTrain<-read.table(".\\train\\X_train.txt", col.names=features[,2])
xTrain <- xTrain[,features_2]
subTrain<-read.table(".\\train\\subject_train.txt", col.names="subject")
yTrain<-read.table(".\\train\\y_train.txt", col.names="activity_ID")

###create training set
trainingData <- cbind(yTrain,subTrain,xTrain)

#load sets for test data
xTest<-read.table(".\\test\\X_test.txt", col.names=features[,2])
xTest <- xTest[,features_2]
subTest<-read.table(".\\test\\subject_test.txt", col.names="subject")
yTest<-read.table(".\\test\\y_test.txt", col.names="activity_ID")

###create test data
testData = cbind(yTest,subTest,xTest)

## merge datasets
whole_dataset <- rbind(trainingData, testData)

#create final, tidy data set
tidyData = merge(whole_dataset,activity,by.x='activity_ID',by.y="activity_ID");
tidyData<- tidyData[,-1]

library(reshape2)
###rearrange data
moltenData <- melt(tidyData, id = c("activityType", "subject"))
# calculate means, for each participant and each activity
tidyDataMeans <- dcast(moltenData, activityType + subject ~ variable, mean)

# export the tidy data set with calculated means
write.table(tidyDataMeans, file="tidyData_means.txt", quote=FALSE, row.names=FALSE, sep="\t")


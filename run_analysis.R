#Loading dplyr package
library(dplyr)

#Reading train files
trainsub <- read.table(file.path("train", "subject_train.txt"))
trainX <- read.table(file.path("train", "X_train.txt"))
trainY <- read.table(file.path("train", "y_train.txt"))

#Reading test files
testsub <- read.table(file.path("test", "subject_test.txt"))
testX <- read.table(file.path("test", "X_test.txt"))
testY <- read.table(file.path("test", "y_test.txt"))

#Reading features and activity files
features <- read.table(file.path("features.txt"), as.is = TRUE)
activity <- read.table(file.path("activity_labels.txt"))

#Step 1. Merges the training and the test sets to create one data set

humanActivity <- rbind(cbind(trainsub, trainX, trainY), cbind(testsub, testX, testY)
)

#Setting colnames
colnames(humanActivity) <- c("subject", features[, 2], "activity")

#Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

humanActivity <- humanActivity[grepl(pattern = "mean|std|subject|activity", colnames(humanActivity))]

#Step 3. Uses descriptive activity names to name the activities in the data set
#Making a activity column as a factor with levels
humanActivity$activity <- as.factor(humanActivity$activity)
levels(humanActivity$activity) <- activity$V2

#Remove useless data sets
rm(features, testsub, testX, testY, trainsub, trainX, trainY, activity)

#Step 4. Appropriately labels the data set with descriptive variable names.

colnames(humanActivity) <- gsub("[-\\(\\)]","",colnames(humanActivity))
colnames(humanActivity) <- gsub("^t","denoteTime",colnames(humanActivity))
colnames(humanActivity) <- gsub("^f","frequency",colnames(humanActivity))
colnames(humanActivity) <- gsub("Acc","Accelerometer",colnames(humanActivity))
colnames(humanActivity) <- gsub("mean","Mean",colnames(humanActivity))
colnames(humanActivity) <- gsub("std","Standard deviation",colnames(humanActivity))
colnames(humanActivity) <- gsub("Gyro","Gyroscope",colnames(humanActivity))
colnames(humanActivity) <- gsub("Mag","Magnitude",colnames(humanActivity))
colnames(humanActivity) <- gsub("Freq","Frequency",colnames(humanActivity))
colnames(humanActivity) <- gsub("BodyBody","Body",colnames(humanActivity))

#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Finding average grouping by subject and activity values
tidydata <- humanActivity %>% group_by(subject, activity) %>% summarise_all(mean)

#Writing tidydata to txt file
write.table(tidydata, file = "tidydata.txt", quote = FALSE, row.names = FALSE)


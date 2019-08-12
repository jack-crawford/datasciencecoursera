library(dplyr)
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#1.
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
merged <- cbind(subject, x, y)
#2.
tidied <- merged %>% select(subject, code, contains("mean"), contains("std"))

#3.
tidied$code <- activities[tidied$code, 2]

names(tidied)[2] = "activity"
names(tidied)<-gsub("Acc", "Accelerometer", names(tidied))
names(tidied)<-gsub("Gyro", "Gyroscope", names(tidied))
names(tidied)<-gsub("BodyBody", "Body", names(tidied))
names(tidied)<-gsub("Mag", "Magnitude", names(tidied))
names(tidied)<-gsub("^t", "Time", names(tidied))
names(tidied)<-gsub("^f", "Frequency", names(tidied))
names(tidied)<-gsub("tBody", "TimeBody", names(tidied))
names(tidied)<-gsub("-mean()", "Mean", names(tidied), ignore.case = TRUE)
names(tidied)<-gsub("-std()", "STD", names(tidied), ignore.case = TRUE)
names(tidied)<-gsub("-freq()", "Frequency", names(tidied), ignore.case = TRUE)
names(tidied)<-gsub("angle", "Angle", names(tidied))
names(tidied)<-gsub("gravity", "Gravity", names(tidied))
#4.
finalData <- tidied %>% group_by(subject, activity)%>%
  summarise_all(funs(mean))
write.table(finalData, "finalData.txt", row.name=FALSE)


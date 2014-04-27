#First, we load all the training data.
dfTest <- read.table("UCI HAR Dataset/test/X_test.txt")
dfTraining <- read.table("UCI HAR Dataset/train/X_train.txt")

#Read the activity number for each feature vector
dfTestActivity <- read.table("UCI HAR Dataset/test/Y_test.txt")
dfTrainingActivity <- read.table("UCI HAR Dataset/train/Y_train.txt")

#Read in the subject number for each feature vector
dfTestSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
dfTrainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Merge the two datasets
dfData <- rbind(dfTest, dfTraining)
dfActivityId <- rbind(dfTestActivity, dfTrainingActivity)
dfSubjectId <- rbind(dfTestSubject, dfTrainingSubject)
colnames(dfSubjectId) <- "Subject"

#Read in activity label meanings and join with the activity numbers
dfActivity <-  read.table("UCI HAR Dataset/activity_labels.txt")
colnames(dfActivity) <- c("Id", "Activity")
colnames(dfActivityId) <- "Id"
dfActivityNames <- merge(dfActivityId, dfActivity, sort=FALSE)

#Read in feature names
dfFeatures <-  read.table("UCI HAR Dataset/features.txt")
colnames(dfFeatures) <- c("Id", "Name")
colnames(dfData) <- dfFeatures$Name

#Extracts only mean and sd measurements
dfDataExtracted <- dfData[,grepl("std\\(\\)",colnames(dfData)) | grepl("mean\\(\\)",colnames(dfData))] 

#Combines activity and subject labels
dfDataClean <- cbind(dfSubjectId, dfActivityNames[,c("Activity"), drop=FALSE], dfDataExtracted)

#Creates the second data set
dfDataSummary <- aggregate(dfDataClean[,3:ncol(dfDataClean)],by=list(Subject = dfDataClean$Subject, Activity = dfDataClean$Activity), mean)


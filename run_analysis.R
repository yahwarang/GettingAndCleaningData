

# Make sure that below codes are working in the directory which has 'UCI HAR Dataset'
# as its sub-directory.
topDirectory <- "./UCI HAR Dataset/"
trainDataDirectory <- paste(topDirectory, "train/", sep = "")
testDataDirectory <- paste(topDirectory, "test/", sep = "")

bindToOne <- function(directory1, fileName1, directory2, fileName2) {
  rbind(read.table(paste(directory1, fileName1, sep="")), 
        read.table(paste(directory2, fileName2, sep="")))
}

# loading & combine data
data <- bindToOne(trainDataDirectory, "X_train.txt", testDataDirectory, "X_test.txt")
label <- bindToOne(trainDataDirectory, "y_train.txt", testDataDirectory, "y_test.txt")
subject <- bindToOne(trainDataDirectory, "subject_train.txt", testDataDirectory, "subject_test.txt")
colnames(subject) <- "subject"


features <- read.table(paste(topDirectory, "features.txt", sep = ""))
# extracting columns.
clmnNamesHavingMeanOrStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
# subsetting
data <- data[, clmnNamesHavingMeanOrStd]
colnames(data) <- gsub("\\(\\)", "", features[clmnNamesHavingMeanOrStd, 2]) # remove parenthesis


# labeling activity
activity <- read.table(paste(topDirectory, "activity_labels.txt", sep = ""))
activityLabel <- activity[label[, 1], 2]
label[, 1] <- activity[label[, 1], 2]
colnames(label) <- "activity"


# write tidyData.txt
finalData <- cbind(subject, data, label)
write.table(finalData, "tidyData.txt", row.names = FALSE) 


#using ddply to make averaged data by subject and activity.
library(plyr)
averagesData <- ddply(finalData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagesData, "averagedTidyData.txt")

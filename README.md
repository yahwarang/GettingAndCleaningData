# Introduction

This project has a R script('run_analysis.R') made for combining & cleaning several raw data collected from the accelerometers Samsung Galaxy S smartphones.
The script makes thow text files, both of these files can be loaded as a complete dataFrame in R. 

# Instructions

1. Getting a zipped file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip it.
3. Make sure that run_analysis.R in the directory which has a directory 'UCI HAR Dataset/'

# Output

run_analysis.R generates 2 files
* tidyData.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the train and test data,
* averagedTindyData.txt: a space-delimited value file that contains tidy data set with the average of each variable for each activity and each subject


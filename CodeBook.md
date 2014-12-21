# Introduction

This pages explains how run_analysis.R works. 
The script was made under the assumption, it is worked in a directory having 'UCI HAR Dataset' as a sub-directory. If this assumption is not met, you can simply change the first file of the script, then there would be not any problems to work with it.  

# Variables
* data : a combined data from train and test data sets.
* label : labled data of each observations.
* subject : the subject-id of each observations.
* activity : a data frame having two columns the first column has a index, and the second column has human readable label(activity)



* finalData : a tidy dataFrame combining 'data, label, subject'. 
* averagedData : another tidy dataFrame with the average of each variable for each activity and each subject



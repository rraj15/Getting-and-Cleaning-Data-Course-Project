## Getting and Cleaning Data Course Project
This repository contains "run_analysis.R" file which does the following:
- Reads the downloaded train and test data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# To run this file
- First download the data file from below and unzip it in a local directory
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Download "run_analysis.R" file in the same directory as the data set above
- Source and run "run_analysis.R" in RStudio or RConsole
- The output will be tidyAverageData.txt file with the average of each variable for each activity and each subject



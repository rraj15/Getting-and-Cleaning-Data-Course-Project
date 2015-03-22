**Data File:**
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
**Data File Description:**
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repository has "run_analysis.R" script. This script:
- Merges the training and the test sets to create one data set called mergedData. Test data is 2947 X 561 and Train data is 7352 X 561. Hence the merged data is 10299 X 561.

- Extracts only the measurements on the mean and standard deviation for each measurement. To do this, first read the "features.txt" file. Find the ids for the columns containing mean and standard deviation. There are 33 mean and 33 standard deviation variables and hence total 66 variables. After finding column ids, extract these from the merged data set.

- Uses descriptive activity names to name the activities in the data set. Activity names are stored in "activity_labels.txt" file. Replace the activity label by the description in the activity_labels file.

- Appropriately labels the data set with descriptive variable names - Take the feature name for mean and standard deviation from features.txt and apply them to the merged data set using colnames function. Finally, merge Activity name and Subject in the merged data set. This resulted in 10299 X 68 data set containing Subject, Activity, 33 mean variables, 33 standard deviation variables

- From the data set in the above step, create a second, independent tidy data set with the average of each variable for each activity and each subject. Used dplyr package for creating tidy data. First group_by on subject and activity and then use summarise_each function for computing average/mean for each variable for each subject for each acitivity. This resulted in 180 X 68 data frame as there are 30 subjects, each participating in 6 distinct activities.



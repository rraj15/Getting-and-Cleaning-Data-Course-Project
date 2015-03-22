run_analysis<-function () {
  
  #####
  # Part-1 of the assignment - Merge Train and Test Dataset
  #####
  # Read Test data
  testDataFileName<-"test/X_test.txt"
  testDataActivityLabelFileName<-"test/y_test.txt"
  testSubjectFileName<-"test/subject_test.txt"
  testData<-read.table(testDataFileName)
  testDataActivityLabel<-read.table(testDataActivityLabelFileName)
  testSubject<-read.table(testSubjectFileName)
  print("Read Test Data - Dim below")
  print(dim(testData))
  print(dim(testDataActivityLabel))
  print(dim(testSubject))
  
  # Read Train data
  trainDataFileName<-"train/X_train.txt"
  trainDataActivityLabelFileName<-"train/y_train.txt"
  trainSubjectFileName<-"train/subject_train.txt"
  trainData<-read.table(trainDataFileName)
  trainDataActivityLabel<-read.table(trainDataActivityLabelFileName)
  trainSubject<-read.table(trainSubjectFileName)
  print("Read Train Data - Dim below")
  print(dim(trainData))
  print(dim(trainDataActivityLabel))
  print(dim(trainSubject))
  
  # Merge Test and Train data
  mergedData<-rbind(testData,trainData)
  mergedDataActivityLabel<-rbind(testDataActivityLabel,trainDataActivityLabel)
  mergedSubject<-rbind(testSubject,trainSubject)
  print("Test and Train data is merged- Dim below")
  print(dim(mergedData))
  print(dim(mergedDataActivityLabel))
  print(dim(mergedSubject))
  
  #####
  # Part-2 of the assignment - Extracts only the measurements on the mean
  #                            and standard deviation for each measurement
  #####
  # Find column numbers for mean and standard deviation for each measurement
  featureFileName<-"features.txt"
  featureData<-read.table(featureFileName)
  mean_idx <- which(apply(featureData, 1, function(x) any(grep("mean\\()", x))))
  print(length(mean_idx))
  std_idx<- which(apply(featureData, 1, function(x) any(grep("std()", x))))
  print(length(std_idx))
  # Read mean and standard deviation only
  colsToRead<-sort(c(mean_idx,std_idx))
  extractedMergedData<-mergedData[,colsToRead]
  print(dim(extractedMergedData))
  
  #####
  # Part-3 of the assignment - Uses descriptive activity names to name 
  #                            the activities in the data set
  #####
  # Read activity Labels
  activityLabelsFileName<-"activity_labels.txt"
  activityNames<-read.table(activityLabelsFileName)
  
  # Descriptive Activity Label
  for(i in 1:nrow(activityNames)) {
    mergedDataActivityLabel[mergedDataActivityLabel==i]<-as.character(activityNames[i,2])
  }
  
  # Merge Subject, Activity Label with the extracted data
  activityData<-cbind(mergedSubject,mergedDataActivityLabel,extractedMergedData)
  
  #####
  # Part-4 of the assignment - Appropriately labels the data set with 
  #                            descriptive variable names
  #####
  colnames(activityData)<-c("Subject","Activity",as.character(featureData[colsToRead,2]))
  
  #####
  # Part-5 of the assignment - create a tidy data set with the average of each 
  #                            variable for each activity and each subject
  #####
  library(dplyr)
  # Average By Activity for Each Subject
  tidyDataAverage<- activityData %>%
    group_by(Subject,Activity) %>%
      summarise_each(funs(mean))
  
  write.table(tidyDataAverage,file="tidyDataAverage.txt",row.name=FALSE)
}

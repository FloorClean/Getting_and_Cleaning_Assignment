# Code to complete the assignment for the Getting and Cleaning data course

# First, read in the necessary files, start by moving into the same working directory as the dataset

library(dplyr)
#setwd("UCI HAR Dataset") #assuming you were previously in the directory just above this

#Start by reading in the variables required for train dataset

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#now bind these together into one table

Train_table <- cbind(subject_train,y_train,X_train)

#take the exact same steps with the test tables

#Start by reading in the variables required for test dataset

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#now bind these together into one table

Test_table <- cbind(subject_test,y_test,X_test)

#Now merge the test and train tables to make one larger table

All_data <- rbind(Train_table,Test_table)

#Now add appropriate column names

#first load in names from features, for column names of each measurement

features <- read.table("features.txt")

colnames(All_data) <- c("subject","activity",as.character(features[,2]))

#Now, go through and match activity numbers and replace with activity names as given in the file activity_labels.txt

activities <- read.table("activity_labels.txt")

for(i in 1:6) {
  
  All_data$activity[All_data$activity==i] <- as.character(activities[i,2])
}

#Now go and subset to only grab those columns that relate either to the mean or the standard deviation (including here mean frequenscy as well)

Data_meanstd <- All_data[,c("subject","activity",colnames(All_data)[grep("mean()",colnames(All_data))],colnames(All_data)[grep("std()",colnames(All_data))])]

#Finally, create a new dataset that contains means, grouped by subject and activity

Tidy_data <- Data_meanstd %>% group_by(subject,activity) %>% summarise_each(funs(mean))

final_table <- write.table(Tidy_data,file = "Tidy_data_file.txt", row.name=FALSE)


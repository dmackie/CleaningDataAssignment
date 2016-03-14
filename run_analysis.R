##
# Assignment: Getting and Cleaning Data Course Project
#
# This script merges and cleans the given dataset 
# and outputs a new summary dataset
#
# Done as part of the Coursera course Getting and Cleaning Data 
# by Johns Hopkins University
#
# (c) Dave Mackie
##
library(plyr)

############################################################
## Setup path to dataset files
############################################################
data_base_path <- "./UCI HAR Dataset"

x_test_path <- file.path(data_base_path, "test", "X_test.txt")
y_test_path <- file.path(data_base_path, "test", "Y_test.txt")
subject_test_path <- file.path(data_base_path, "test", "subject_test.txt")
x_train_path <- file.path(data_base_path, "train", "X_train.txt")
y_train_path <- file.path(data_base_path, "train", "Y_train.txt")
subject_train_path <- file.path(data_base_path, "train", "subject_train.txt")
features_path <- file.path(data_base_path, "features.txt")
activity_labels_path <- file.path(data_base_path, "activity_labels.txt")

average_by_subject_by_activity_path <- file.path("average_by_subject_by_activity.txt")


############################################################
## Read in X test & training files and combine. 
############################################################
message("Reading in: ", x_test_path)
x_test <- read.table(x_test_path, sep = "", quote = "")
message("Reading in: ", x_train_path)
x_train <- read.table(x_train_path, sep = "", quote = "")
x_merge <- rbind(x_test, x_train)
rm("x_test")
rm("x_train")


############################################################
## Read in Y test & training files and combine. 
############################################################
message("Reading in: ", y_test_path)
y_test <- read.table(y_test_path, sep = "", quote = "", col.names = "activity")
message("Reading in: ", y_train_path)
y_train <- read.table(y_train_path, sep = "", quote = "", col.names = "activity")
y_merge <- rbind(y_test, y_train)
rm("y_test")
rm("y_train")


############################################################
## Read in subject IDs test & training files and combine. 
############################################################
message("Reading in: ", subject_test_path)
subject_test <- read.table(subject_test_path, sep = "", quote = "", col.names = "subject_id")
message("Reading in: ", subject_train_path)
subject_train <- read.table(subject_train_path, sep = "", quote = "", col.names = "subject_id")
subject_merge <- rbind(subject_test, subject_train)
rm("subject_test")
rm("subject_train")


############################################################
## Read in feature names and apply to data set 
############################################################
features <- read.table(features_path, sep = "", quote = "")
names(x_merge) <- features$V2


############################################################
## Only use mean() and std() measurements
############################################################
col_mean_std <- grep("(mean|std)\\(", features$V2, value = FALSE)
x_merge_mean_std <- x_merge[,col_mean_std]
rm("x_merge")


############################################################
## Add descriptive activity names
############################################################
activity_labels <- read.table(activity_labels_path, sep = "", quote = "")
y_merge_activity <- mutate(y_merge, activity = activity_labels$V2[activity])
rm("y_merge")


############################################################
## Merge the subject, activity and measurements into single
## data set (Human Activity Recognition)
############################################################
har_data <- cbind(subject_merge, y_merge_activity, x_merge_mean_std)


############################################################
## Create new data set containing average of each measurement
## by subject AND activity, and write it out.
############################################################
average_by_subject_by_activity <- tbl_df(har_data) %>% group_by(subject_id, activity) %>% summarize_each(funs(mean))

message("Writing to: ", average_by_subject_by_activity_path)
write.table(average_by_subject_by_activity, average_by_subject_by_activity_path, row.names = FALSE)

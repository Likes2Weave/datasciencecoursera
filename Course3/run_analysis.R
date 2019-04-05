## R script called run_analysis.R does the following.

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

## Data should be tidy:
## 1. Each variable forms a column.
## 2. Each observation forms a row.
## 3. Each type of observational unit forms a table.

install.packages("R.utils")
library("R.utils")
install.packages("dplyr")
library(dplyr)

## Start with the data in test file, since it is smaller
## Read test data into data files - 2947 lines each
## Name of the data file will match name of text file

subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
Y_test <- read.table("UCI_HAR_Dataset/test/Y_test.txt", header = FALSE)

## Set column names, follow conventions used in original dataset README.txt and features_info.txt
## Later update column names to be more descriptive
names(subject_merge) <- "subject"
names(Y_merge) <- "activity"
names(X_merge) <- features

## Bind in order of subject (subject_test), activity (Y_test), then recorded measurements (X_test).
test_merged <- cbind(subject_test, Y_test, X_test)

## Read train data into data files 
## Name of the data file will match name of text file

subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)
X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt", header = FALSE)
Y_train <- read.table("UCI_HAR_Dataset/train/Y_train.txt", header = FALSE)

## Set column names, follow conventions used in original dataset README.txt and features_info.txt
## Later update column names to be more descriptive
names(subject_train) <- "subject"
names(Y_train) <- "activity"
names(X_train) <- features

## Bind in order of subject (subject_test), activity (Y_test), then recorded measurements (X_test).
train_merged <- cbind(subject_train, Y_train, X_train)

## For each test_merge and train_merge table, add a new column that records the original file name.
## library(dplyr)
test_add <- mutate(test_merged, original_file = "test")
train_add <- mutate(train_merged, original_file = "train")

## Combine test_add and train_add tables into a single table
## 2947 from test + 7352 from train = 10299 in test_train
## matches the 10299 instances recorded in raw data
test_train <- rbind(test_add, train_add)


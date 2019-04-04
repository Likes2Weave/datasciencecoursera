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

## Read test data into data files
## Name of the data file will match name of text file

subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
Y_test <- read.table("UCI_HAR_Dataset/test/Y_test.txt", header = FALSE)


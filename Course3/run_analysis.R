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

## Double check working directory with Github & version control
## setwd("~/GitHub/datasciencecoursera/Course3")

##install.packages("R.utils")
library("R.utils")
##install.packages("dplyr")
library(dplyr)

## 1. Merge the training and the test sets to create one data set
## Start with the data in test file, since it is smaller
## Read test data into data files - 2947 lines each
## Name of the data file will match name of text file

subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
Y_test <- read.table("UCI_HAR_Dataset/test/Y_test.txt", header = FALSE)

## features.txt has some duplicate variable names, differing only by index
## fBodyAcc-bandsEnergy()-1,8 appears at 303, 317, 331
## there are three groups of 14 variables that start with "fBodyAcc()-" and end with an ordered pair
## use readLInes to keep line number index with variable name
features <- readLines("UCI_HAR_Dataset/features.txt")

## Set column names, follow conventions used in original dataset README.txt and features_info.txt
## Later update column names to be more descriptive
names(subject_test) <- "subject"
names(Y_test) <- "activityNumber"
names(X_test) <- features

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
names(Y_train) <- "activityNumber"
names(X_train) <- features

## Bind in order of subject (subject_test), activity (Y_test), then recorded measurements (X_test).
train_merged <- cbind(subject_train, Y_train, X_train)

## For each test_merge and train_merge table, add a new column that records the original file name.
## library(dplyr)
test_add <- mutate(test_merged, originalFile = "test")
train_add <- mutate(train_merged, originalFile = "train")

## Combine test_add and train_add tables into a single table
## 2947 from test + 7352 from train = 10299 in test_train
## matches the 10299 instances recorded in raw data
test_train <- rbind(test_add, train_add)

## new dataframe with fixed variable first
tidyframe <- select(test_train, 564, 1:563)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.
## Based on features_info.txt, observed features representing mean or standard deviation 
## include "mean()", "std()" in their name. 
## use grep to find target strings mean(), std()
## should get 89 variables = sum of occurrence of each string
## not including originalFile, activityNumber, subject
mean_std_columns <- grep("mean()|std()", names(tidyframe), value = TRUE)
mean_std_tidyframe <- select(tidyframe, originalFile, activityNumber, subject, mean_std_columns )

## 3. Use descriptive activity names to name the activities in the data set
## An activity id/number and name is listed in activity_labels.txt for each unique activity
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt", header = FALSE)
names(activity_labels) <- c("activityNumber","activityName")
                            
## apply names to mean_std_tidyframe w/ join, move name to be contiguous w/ fixed variables
activity_tidyframe <- inner_join(mean_std_tidyframe, activity_labels, by = "activityNumber")
activity_tidyframe <- select (activity_tidyframe, originalFile, activityName, subject, 4:82)

## Fix replace dashes and remove parentheses
names_dash_to_under <- gsub("-", "_", names(activity_tidyframe))
names_no_paren <- gsub("\\(\\)", "", names_dash_to_under)

## remove leading digits, set new variable names
names_no_digits <- gsub("^[0-9]{1,3} ", "", names_no_paren)

## descriptive_tidyframe will be identical to activity_tidyframe except for variable names
descriptive_tidyframe <- activity_tidyframe
names(descriptive_tidyframe) <- names_no_digits

## average variables, group by subject & activity, omit original_file (column 1) from data
final_tidyframe <- descriptive_tidyframe %>%
    select (2:82) %>%
    group_by(subject, activityName) %>% 
    summarise_all(mean)

## Final Step - output to csv for end user
write.table(final_tidyframe, "final_tidyframe.csv", row.names = FALSE, col.names = TRUE, sep = ",")

## to read file:
## my_final_tidyframe <- read.table("final_tidyframe.csv", header = TRUE, sep = ",")
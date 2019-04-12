Codebook
================
Coleen Smith
12 April 2019

-   [Project Description](#project-description)
    -   [Notes on the original (raw) data](#notes-on-the-original-raw-data)
-   [Creating the tidy data set (final\_tidyframe)](#creating-the-tidy-data-set-final_tidyframe)
-   [Description of the variables in the tiny\_data.txt file](#description-of-the-variables-in-the-tiny_data.txt-file)
    -   [Fixed Variables](#fixed-variables)
    -   [Measured Variables](#measured-variables)

Project Description
-------------------

This assignment will create one R script called run\_analysis.R that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set.
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Notes on the original (raw) data

The data for this project came from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) that was "built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors." From: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

[Full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [Link to data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Creating the tidy data set (final\_tidyframe)
---------------------------------------------

For this assignment, I merged data files from the original UCI Data Set containing, information about subject, activity and a set of 561 features measurements. The final product was a tidy data set (final\_tidyframe) that represeneted the average of each variable for each combination of activity and subject.

For a complete description of the steps to complete the assignment, please review [Readme](https://github.com/Likes2Weave/datasciencecoursera/blob/master/Course3/Readme.md) available in the GitHub repository.

``` r
    final_tidyframe <- read.table("final_tidyframe.csv", header = TRUE, sep = ",")
```

Description of the variables in the tiny\_data.txt file
-------------------------------------------------------

Dimensions: 180 observations of 81 variables. Variables:

``` r
    ## show names
    names(final_tidyframe)
```

    ##  [1] "subject"                       "activityName"                 
    ##  [3] "tBodyAcc_mean_X"               "tBodyAcc_mean_Y"              
    ##  [5] "tBodyAcc_mean_Z"               "tBodyAcc_std_X"               
    ##  [7] "tBodyAcc_std_Y"                "tBodyAcc_std_Z"               
    ##  [9] "tGravityAcc_mean_X"            "tGravityAcc_mean_Y"           
    ## [11] "tGravityAcc_mean_Z"            "tGravityAcc_std_X"            
    ## [13] "tGravityAcc_std_Y"             "tGravityAcc_std_Z"            
    ## [15] "tBodyAccJerk_mean_X"           "tBodyAccJerk_mean_Y"          
    ## [17] "tBodyAccJerk_mean_Z"           "tBodyAccJerk_std_X"           
    ## [19] "tBodyAccJerk_std_Y"            "tBodyAccJerk_std_Z"           
    ## [21] "tBodyGyro_mean_X"              "tBodyGyro_mean_Y"             
    ## [23] "tBodyGyro_mean_Z"              "tBodyGyro_std_X"              
    ## [25] "tBodyGyro_std_Y"               "tBodyGyro_std_Z"              
    ## [27] "tBodyGyroJerk_mean_X"          "tBodyGyroJerk_mean_Y"         
    ## [29] "tBodyGyroJerk_mean_Z"          "tBodyGyroJerk_std_X"          
    ## [31] "tBodyGyroJerk_std_Y"           "tBodyGyroJerk_std_Z"          
    ## [33] "tBodyAccMag_mean"              "tBodyAccMag_std"              
    ## [35] "tGravityAccMag_mean"           "tGravityAccMag_std"           
    ## [37] "tBodyAccJerkMag_mean"          "tBodyAccJerkMag_std"          
    ## [39] "tBodyGyroMag_mean"             "tBodyGyroMag_std"             
    ## [41] "tBodyGyroJerkMag_mean"         "tBodyGyroJerkMag_std"         
    ## [43] "fBodyAcc_mean_X"               "fBodyAcc_mean_Y"              
    ## [45] "fBodyAcc_mean_Z"               "fBodyAcc_std_X"               
    ## [47] "fBodyAcc_std_Y"                "fBodyAcc_std_Z"               
    ## [49] "fBodyAcc_meanFreq_X"           "fBodyAcc_meanFreq_Y"          
    ## [51] "fBodyAcc_meanFreq_Z"           "fBodyAccJerk_mean_X"          
    ## [53] "fBodyAccJerk_mean_Y"           "fBodyAccJerk_mean_Z"          
    ## [55] "fBodyAccJerk_std_X"            "fBodyAccJerk_std_Y"           
    ## [57] "fBodyAccJerk_std_Z"            "fBodyAccJerk_meanFreq_X"      
    ## [59] "fBodyAccJerk_meanFreq_Y"       "fBodyAccJerk_meanFreq_Z"      
    ## [61] "fBodyGyro_mean_X"              "fBodyGyro_mean_Y"             
    ## [63] "fBodyGyro_mean_Z"              "fBodyGyro_std_X"              
    ## [65] "fBodyGyro_std_Y"               "fBodyGyro_std_Z"              
    ## [67] "fBodyGyro_meanFreq_X"          "fBodyGyro_meanFreq_Y"         
    ## [69] "fBodyGyro_meanFreq_Z"          "fBodyAccMag_mean"             
    ## [71] "fBodyAccMag_std"               "fBodyAccMag_meanFreq"         
    ## [73] "fBodyBodyAccJerkMag_mean"      "fBodyBodyAccJerkMag_std"      
    ## [75] "fBodyBodyAccJerkMag_meanFreq"  "fBodyBodyGyroMag_mean"        
    ## [77] "fBodyBodyGyroMag_std"          "fBodyBodyGyroMag_meanFreq"    
    ## [79] "fBodyBodyGyroJerkMag_mean"     "fBodyBodyGyroJerkMag_std"     
    ## [81] "fBodyBodyGyroJerkMag_meanFreq"

In his paper, "Tidy Data," Wickham discusses the order in which variables should appear in a data set:

> "Fixed variables describe the experimental design and are known in advance... Measured variables are what we actually measure in the study. Fixed variables should come first, followed by measured variables, each ordered so that related variables are contiguous."

By this standard, subject and activityName would be fixed variables and should appear contiguously and first. Measured variables would be the items described by the feature measurements included in the original data set.

### Fixed Variables

#### subject

Class: Integer Values: Range from 1 -30 Source: UCI HAR Data Set subject\_test.txt and subject\_train.txt

#### activityName

Class: Factor with 6 levels Values: LAYING, SITTING, STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS Source: UCI HAR Data Set activity\_labels.txt Notes: Assigned to observations based on the activity number from Y\_test.txt and Y\_train.txt mapped to the activity number and name pair in activity\_labels.txt

### Measured Variables

The remaining variables in column 3-81 are computed values. Class: Numeric Values: calculated average of the Source mean and standard deviation measurements Source: UCI HAR Data Set X\_test.txt and X\_train.text Notes: For a detailed summary of the original data, review the [ReadMe.txt](https://github.com/Likes2Weave/datasciencecoursera/blob/master/Course3/UCI_HAR_Dataset/features_info.txt) included in the original data set.

``` r
    summary(final_tidyframe[3:81])
```

    ##  tBodyAcc_mean_X  tBodyAcc_mean_Y     tBodyAcc_mean_Z    tBodyAcc_std_X   
    ##  Min.   :0.2216   Min.   :-0.040514   Min.   :-0.15251   Min.   :-0.9961  
    ##  1st Qu.:0.2712   1st Qu.:-0.020022   1st Qu.:-0.11207   1st Qu.:-0.9799  
    ##  Median :0.2770   Median :-0.017262   Median :-0.10819   Median :-0.7526  
    ##  Mean   :0.2743   Mean   :-0.017876   Mean   :-0.10916   Mean   :-0.5577  
    ##  3rd Qu.:0.2800   3rd Qu.:-0.014936   3rd Qu.:-0.10443   3rd Qu.:-0.1984  
    ##  Max.   :0.3015   Max.   :-0.001308   Max.   :-0.07538   Max.   : 0.6269  
    ##  tBodyAcc_std_Y     tBodyAcc_std_Z    tGravityAcc_mean_X
    ##  Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.6800   
    ##  1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.: 0.8376   
    ##  Median :-0.50897   Median :-0.6518   Median : 0.9208   
    ##  Mean   :-0.46046   Mean   :-0.5756   Mean   : 0.6975   
    ##  3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.: 0.9425   
    ##  Max.   : 0.61694   Max.   : 0.6090   Max.   : 0.9745   
    ##  tGravityAcc_mean_Y tGravityAcc_mean_Z tGravityAcc_std_X tGravityAcc_std_Y
    ##  Min.   :-0.47989   Min.   :-0.49509   Min.   :-0.9968   Min.   :-0.9942  
    ##  1st Qu.:-0.23319   1st Qu.:-0.11726   1st Qu.:-0.9825   1st Qu.:-0.9711  
    ##  Median :-0.12782   Median : 0.02384   Median :-0.9695   Median :-0.9590  
    ##  Mean   :-0.01621   Mean   : 0.07413   Mean   :-0.9638   Mean   :-0.9524  
    ##  3rd Qu.: 0.08773   3rd Qu.: 0.14946   3rd Qu.:-0.9509   3rd Qu.:-0.9370  
    ##  Max.   : 0.95659   Max.   : 0.95787   Max.   :-0.8296   Max.   :-0.6436  
    ##  tGravityAcc_std_Z tBodyAccJerk_mean_X tBodyAccJerk_mean_Y 
    ##  Min.   :-0.9910   Min.   :0.04269     Min.   :-0.0386872  
    ##  1st Qu.:-0.9605   1st Qu.:0.07396     1st Qu.: 0.0004664  
    ##  Median :-0.9450   Median :0.07640     Median : 0.0094698  
    ##  Mean   :-0.9364   Mean   :0.07947     Mean   : 0.0075652  
    ##  3rd Qu.:-0.9180   3rd Qu.:0.08330     3rd Qu.: 0.0134008  
    ##  Max.   :-0.6102   Max.   :0.13019     Max.   : 0.0568186  
    ##  tBodyAccJerk_mean_Z tBodyAccJerk_std_X tBodyAccJerk_std_Y
    ##  Min.   :-0.067458   Min.   :-0.9946    Min.   :-0.9895   
    ##  1st Qu.:-0.010601   1st Qu.:-0.9832    1st Qu.:-0.9724   
    ##  Median :-0.003861   Median :-0.8104    Median :-0.7756   
    ##  Mean   :-0.004953   Mean   :-0.5949    Mean   :-0.5654   
    ##  3rd Qu.: 0.001958   3rd Qu.:-0.2233    3rd Qu.:-0.1483   
    ##  Max.   : 0.038053   Max.   : 0.5443    Max.   : 0.3553   
    ##  tBodyAccJerk_std_Z tBodyGyro_mean_X   tBodyGyro_mean_Y  
    ##  Min.   :-0.99329   Min.   :-0.20578   Min.   :-0.20421  
    ##  1st Qu.:-0.98266   1st Qu.:-0.04712   1st Qu.:-0.08955  
    ##  Median :-0.88366   Median :-0.02871   Median :-0.07318  
    ##  Mean   :-0.73596   Mean   :-0.03244   Mean   :-0.07426  
    ##  3rd Qu.:-0.51212   3rd Qu.:-0.01676   3rd Qu.:-0.06113  
    ##  Max.   : 0.03102   Max.   : 0.19270   Max.   : 0.02747  
    ##  tBodyGyro_mean_Z   tBodyGyro_std_X   tBodyGyro_std_Y   tBodyGyro_std_Z  
    ##  Min.   :-0.07245   Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
    ##  1st Qu.: 0.07475   1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
    ##  Median : 0.08512   Median :-0.7890   Median :-0.8017   Median :-0.8010  
    ##  Mean   : 0.08744   Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
    ##  3rd Qu.: 0.10177   3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
    ##  Max.   : 0.17910   Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
    ##  tBodyGyroJerk_mean_X tBodyGyroJerk_mean_Y tBodyGyroJerk_mean_Z
    ##  Min.   :-0.15721     Min.   :-0.07681     Min.   :-0.092500   
    ##  1st Qu.:-0.10322     1st Qu.:-0.04552     1st Qu.:-0.061725   
    ##  Median :-0.09868     Median :-0.04112     Median :-0.053430   
    ##  Mean   :-0.09606     Mean   :-0.04269     Mean   :-0.054802   
    ##  3rd Qu.:-0.09110     3rd Qu.:-0.03842     3rd Qu.:-0.048985   
    ##  Max.   :-0.02209     Max.   :-0.01320     Max.   :-0.006941   
    ##  tBodyGyroJerk_std_X tBodyGyroJerk_std_Y tBodyGyroJerk_std_Z
    ##  Min.   :-0.9965     Min.   :-0.9971     Min.   :-0.9954    
    ##  1st Qu.:-0.9800     1st Qu.:-0.9832     1st Qu.:-0.9848    
    ##  Median :-0.8396     Median :-0.8942     Median :-0.8610    
    ##  Mean   :-0.7036     Mean   :-0.7636     Mean   :-0.7096    
    ##  3rd Qu.:-0.4629     3rd Qu.:-0.5861     3rd Qu.:-0.4741    
    ##  Max.   : 0.1791     Max.   : 0.2959     Max.   : 0.1932    
    ##  tBodyAccMag_mean  tBodyAccMag_std   tGravityAccMag_mean
    ##  Min.   :-0.9865   Min.   :-0.9865   Min.   :-0.9865    
    ##  1st Qu.:-0.9573   1st Qu.:-0.9430   1st Qu.:-0.9573    
    ##  Median :-0.4829   Median :-0.6074   Median :-0.4829    
    ##  Mean   :-0.4973   Mean   :-0.5439   Mean   :-0.4973    
    ##  3rd Qu.:-0.0919   3rd Qu.:-0.2090   3rd Qu.:-0.0919    
    ##  Max.   : 0.6446   Max.   : 0.4284   Max.   : 0.6446    
    ##  tGravityAccMag_std tBodyAccJerkMag_mean tBodyAccJerkMag_std
    ##  Min.   :-0.9865    Min.   :-0.9928      Min.   :-0.9946    
    ##  1st Qu.:-0.9430    1st Qu.:-0.9807      1st Qu.:-0.9765    
    ##  Median :-0.6074    Median :-0.8168      Median :-0.8014    
    ##  Mean   :-0.5439    Mean   :-0.6079      Mean   :-0.5842    
    ##  3rd Qu.:-0.2090    3rd Qu.:-0.2456      3rd Qu.:-0.2173    
    ##  Max.   : 0.4284    Max.   : 0.4345      Max.   : 0.4506    
    ##  tBodyGyroMag_mean tBodyGyroMag_std  tBodyGyroJerkMag_mean
    ##  Min.   :-0.9807   Min.   :-0.9814   Min.   :-0.99732     
    ##  1st Qu.:-0.9461   1st Qu.:-0.9476   1st Qu.:-0.98515     
    ##  Median :-0.6551   Median :-0.7420   Median :-0.86479     
    ##  Mean   :-0.5652   Mean   :-0.6304   Mean   :-0.73637     
    ##  3rd Qu.:-0.2159   3rd Qu.:-0.3602   3rd Qu.:-0.51186     
    ##  Max.   : 0.4180   Max.   : 0.3000   Max.   : 0.08758     
    ##  tBodyGyroJerkMag_std fBodyAcc_mean_X   fBodyAcc_mean_Y   
    ##  Min.   :-0.9977      Min.   :-0.9952   Min.   :-0.98903  
    ##  1st Qu.:-0.9805      1st Qu.:-0.9787   1st Qu.:-0.95361  
    ##  Median :-0.8809      Median :-0.7691   Median :-0.59498  
    ##  Mean   :-0.7550      Mean   :-0.5758   Mean   :-0.48873  
    ##  3rd Qu.:-0.5767      3rd Qu.:-0.2174   3rd Qu.:-0.06341  
    ##  Max.   : 0.2502      Max.   : 0.5370   Max.   : 0.52419  
    ##  fBodyAcc_mean_Z   fBodyAcc_std_X    fBodyAcc_std_Y     fBodyAcc_std_Z   
    ##  Min.   :-0.9895   Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872  
    ##  1st Qu.:-0.9619   1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459  
    ##  Median :-0.7236   Median :-0.7470   Median :-0.51338   Median :-0.6441  
    ##  Mean   :-0.6297   Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824  
    ##  3rd Qu.:-0.3183   3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655  
    ##  Max.   : 0.2807   Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871  
    ##  fBodyAcc_meanFreq_X fBodyAcc_meanFreq_Y fBodyAcc_meanFreq_Z
    ##  Min.   :-0.63591    Min.   :-0.379518   Min.   :-0.52011   
    ##  1st Qu.:-0.39165    1st Qu.:-0.081314   1st Qu.:-0.03629   
    ##  Median :-0.25731    Median : 0.007855   Median : 0.06582   
    ##  Mean   :-0.23227    Mean   : 0.011529   Mean   : 0.04372   
    ##  3rd Qu.:-0.06105    3rd Qu.: 0.086281   3rd Qu.: 0.17542   
    ##  Max.   : 0.15912    Max.   : 0.466528   Max.   : 0.40253   
    ##  fBodyAccJerk_mean_X fBodyAccJerk_mean_Y fBodyAccJerk_mean_Z
    ##  Min.   :-0.9946     Min.   :-0.9894     Min.   :-0.9920    
    ##  1st Qu.:-0.9828     1st Qu.:-0.9725     1st Qu.:-0.9796    
    ##  Median :-0.8126     Median :-0.7817     Median :-0.8707    
    ##  Mean   :-0.6139     Mean   :-0.5882     Mean   :-0.7144    
    ##  3rd Qu.:-0.2820     3rd Qu.:-0.1963     3rd Qu.:-0.4697    
    ##  Max.   : 0.4743     Max.   : 0.2767     Max.   : 0.1578    
    ##  fBodyAccJerk_std_X fBodyAccJerk_std_Y fBodyAccJerk_std_Z 
    ##  Min.   :-0.9951    Min.   :-0.9905    Min.   :-0.993108  
    ##  1st Qu.:-0.9847    1st Qu.:-0.9737    1st Qu.:-0.983747  
    ##  Median :-0.8254    Median :-0.7852    Median :-0.895121  
    ##  Mean   :-0.6121    Mean   :-0.5707    Mean   :-0.756489  
    ##  3rd Qu.:-0.2475    3rd Qu.:-0.1685    3rd Qu.:-0.543787  
    ##  Max.   : 0.4768    Max.   : 0.3498    Max.   :-0.006236  
    ##  fBodyAccJerk_meanFreq_X fBodyAccJerk_meanFreq_Y fBodyAccJerk_meanFreq_Z
    ##  Min.   :-0.57604        Min.   :-0.60197        Min.   :-0.62756       
    ##  1st Qu.:-0.28966        1st Qu.:-0.39751        1st Qu.:-0.30867       
    ##  Median :-0.06091        Median :-0.23209        Median :-0.09187       
    ##  Mean   :-0.06910        Mean   :-0.22810        Mean   :-0.13760       
    ##  3rd Qu.: 0.17660        3rd Qu.:-0.04721        3rd Qu.: 0.03858       
    ##  Max.   : 0.33145        Max.   : 0.19568        Max.   : 0.23011       
    ##  fBodyGyro_mean_X  fBodyGyro_mean_Y  fBodyGyro_mean_Z  fBodyGyro_std_X  
    ##  Min.   :-0.9931   Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9947  
    ##  1st Qu.:-0.9697   1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9750  
    ##  Median :-0.7300   Median :-0.8141   Median :-0.7909   Median :-0.8086  
    ##  Mean   :-0.6367   Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.7110  
    ##  3rd Qu.:-0.3387   3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.4813  
    ##  Max.   : 0.4750   Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.1966  
    ##  fBodyGyro_std_Y   fBodyGyro_std_Z   fBodyGyro_meanFreq_X
    ##  Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.395770   
    ##  1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.213363   
    ##  Median :-0.7964   Median :-0.8224   Median :-0.115527   
    ##  Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.104551   
    ##  3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.: 0.002655   
    ##  Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.249209   
    ##  fBodyGyro_meanFreq_Y fBodyGyro_meanFreq_Z fBodyAccMag_mean 
    ##  Min.   :-0.66681     Min.   :-0.50749     Min.   :-0.9868  
    ##  1st Qu.:-0.29433     1st Qu.:-0.15481     1st Qu.:-0.9560  
    ##  Median :-0.15794     Median :-0.05081     Median :-0.6703  
    ##  Mean   :-0.16741     Mean   :-0.05718     Mean   :-0.5365  
    ##  3rd Qu.:-0.04269     3rd Qu.: 0.04152     3rd Qu.:-0.1622  
    ##  Max.   : 0.27314     Max.   : 0.37707     Max.   : 0.5866  
    ##  fBodyAccMag_std   fBodyAccMag_meanFreq fBodyBodyAccJerkMag_mean
    ##  Min.   :-0.9876   Min.   :-0.31234     Min.   :-0.9940         
    ##  1st Qu.:-0.9452   1st Qu.:-0.01475     1st Qu.:-0.9770         
    ##  Median :-0.6513   Median : 0.08132     Median :-0.7940         
    ##  Mean   :-0.6210   Mean   : 0.07613     Mean   :-0.5756         
    ##  3rd Qu.:-0.3654   3rd Qu.: 0.17436     3rd Qu.:-0.1872         
    ##  Max.   : 0.1787   Max.   : 0.43585     Max.   : 0.5384         
    ##  fBodyBodyAccJerkMag_std fBodyBodyAccJerkMag_meanFreq
    ##  Min.   :-0.9944         Min.   :-0.12521            
    ##  1st Qu.:-0.9752         1st Qu.: 0.04527            
    ##  Median :-0.8126         Median : 0.17198            
    ##  Mean   :-0.5992         Mean   : 0.16255            
    ##  3rd Qu.:-0.2668         3rd Qu.: 0.27593            
    ##  Max.   : 0.3163         Max.   : 0.48809            
    ##  fBodyBodyGyroMag_mean fBodyBodyGyroMag_std fBodyBodyGyroMag_meanFreq
    ##  Min.   :-0.9865       Min.   :-0.9815      Min.   :-0.45664         
    ##  1st Qu.:-0.9616       1st Qu.:-0.9488      1st Qu.:-0.16951         
    ##  Median :-0.7657       Median :-0.7727      Median :-0.05352         
    ##  Mean   :-0.6671       Mean   :-0.6723      Mean   :-0.03603         
    ##  3rd Qu.:-0.4087       3rd Qu.:-0.4277      3rd Qu.: 0.08228         
    ##  Max.   : 0.2040       Max.   : 0.2367      Max.   : 0.40952         
    ##  fBodyBodyGyroJerkMag_mean fBodyBodyGyroJerkMag_std
    ##  Min.   :-0.9976           Min.   :-0.9976         
    ##  1st Qu.:-0.9813           1st Qu.:-0.9802         
    ##  Median :-0.8779           Median :-0.8941         
    ##  Mean   :-0.7564           Mean   :-0.7715         
    ##  3rd Qu.:-0.5831           3rd Qu.:-0.6081         
    ##  Max.   : 0.1466           Max.   : 0.2878         
    ##  fBodyBodyGyroJerkMag_meanFreq
    ##  Min.   :-0.18292             
    ##  1st Qu.: 0.05423             
    ##  Median : 0.11156             
    ##  Mean   : 0.12592             
    ##  3rd Qu.: 0.20805             
    ##  Max.   : 0.42630

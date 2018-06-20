---
title: "Codebook"
author: "Audrey Julian"
date: "2018/Jun/19"
output:
  html_document:
    keep_md: yes
    toc: yes
    toc_depth: 3
---

<span style="color:red">This is rewrite of previously submitted code.


NOTE: As per the evaluation rubric on Coursera, a tidy
dataset may EITHER be a wide or a long (narrow) form of the data is acceptable.
I opted for a long (narrow) form as described by Hadley Wickham in his tidy data
PDF, page 7, table B entitled Molten data. See References for URL to the PDF of
his work. The course TAs recommended to students who opted for the long (narrow)
tidy data set to emphasize that this method is acceptable per the course 
rubric. Reference this recommendation noted in TA's thoughtfulbloke blog.
See References for URL to his blog, section Part 6 : Getting and Cleaning the 
Assignment, sub-section Bonus Round: Easy Marking.</span> 

## Project Description
This document describes the data acquisition, tidying, and transformation 
process for the completing Coursera's John Hopkins Getting and Cleaning Data 
class project. The assignment requires the creation of an R script, a README 
file, and a CodeBook. This document serves as the project codebook.

##Study Design and Data Processing

###Environment Parameters
This project was developed and tested in the following environment. Code has not
been tested on other platforms and is not guaranteed to function correctly on 
other platforms.

- Hardware: Macbook Air OSX High Sierra 10.13.5
- Internals: Processor1.7 GHz Intel Core i7 with 8 GB 1600 MHz DDR3 RAM
- Language & IDE: R v3.5.0, RStudio v1.1.447

###Installed R Packages, Versions, and Builds
The following R Packages are required to execute the R script.

- all base R packages
- dplyr
- reshape

###Collection of the Raw Data
Data for the course project was download from:

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Afer unpacking the above zip file and storing files under sub-directory 'data',
the needed data has the following structure. Per course instruction all files
in both test and train 'Inertial Signals' sub-directories are ignored.

activity_labels.txt
features.txt
./test/
./train/

Unpacked data files are associated with R data frames internal to the script. 
The data frames have the noted dimension. Outlined as follows:

<b>Data file, R Data Frame name, Dimensions, Note</b>
- activity_labels.txt, activity_labels, 6 rows by 2 columns<BR>
- features.txt, features_labels, 561 rows by 2 columns, after descriptive 
update 561 rows by 3 columns<BR>
- subject_test.txt, test_subject, 2947 rows by 1 column<BR>
- X_test.txt, test_measurements, 2947 rows by 561 columns<BR>
- y_test.txt, test_activities, 2947 rows by 1 column<BR>
- subject_train.txt, train_subject, 2947 rows by 1 column<BR>
- X_train.txt, train_measurements, 2947 rows by 561 columns<BR>
- y_train.txt, train_activities, 2947 rows by 1 column<BR>

##Creating the Tidy Datafile

###Guide to Create the Tidy Data File
Follow these steps to create the tidy data file. These steps are described in 
greater detail in this project's README file. Refer to README as needed.

<b>Step 0:</b> Download course project data and unzip to working directory.<BR>
<b>Step 1:</b> Make 'data' &'output' directories in working directory.<BR>
<b>Step 2:</b> Unzip project data and store files in 'data'.<BR>
<b>Step 3:</b> Source R script run_analysis().<BR>
<b>Step 4:</b> Install known package dependencies to environment.<BR>
<b>Step 5:</b> Evaluate results in "./output".<BR>

###Cleaning of the Data
This is a high-level description of what the cleaning script does. This is 
described in more detail in this project's README file. Refer to README as 
needed. The script:

- Loads the requisite files.<BR>
- Updates measurement variable from features.txt information.<BR>
- Combines subject, activity, and measurement data by test and train.<BR>
- Combines test and train data.<BR>
- Applies descriptive activity names to the combined data.<BR>
- Extracts mean and standard deviation measurements from combined data.<BR>
- Melts the subset data into a narrow long table.<BR>
- Cleans up variable names using the colnames function.<BR>
- Groups data by activity, subject, measurement variable.<BR>
- Summarizes the grouped data to calculate the average on in-scope measurements.<BR>
- Finally the script writes the resulting data to './output/'

Refer to the README file to understand what functions are used for each step of
this process.

##Description of the Variables in the Tidy Data Output File
The tidy data file is called 'tidysummarizedata.csv' and is located in directory
'./output'.

General description of the file including:<BR>
- Dimensions of the dataset: 11,880 rows by 4 columns<BR>
- Summary of the data, summary(tidydf)<BR>
- The variables in the tidy data set are only 4.
    - variable<BR>
    - activity_label<BR>
    - subject_id<BR>
    - mean<BR>

variable | activity_label | subject_id | mean
-------- | -------------- | ---------- | ----
fbodyacc_mean_x:  180 | LAYING            :1980 | Min.   : 1.0 | Min.   :-0.99767
fbodyacc_mean_y:  180 | SITTING           :1980 | 1st Qu.: 8.0 | 1st Qu.:-0.96205
fbodyacc_mean_z:  180 | STANDING          :1980 | Median :15.5 | Median :-0.46989
fbodyacc_std_x :  180 | WALKING           :1980 | Mean   :15.5 | Mean   :-0.48436
fbodyacc_std_y :  180 | WALKING_DOWNSTAIRS:1980 | 3rd Qu.:23.0 | 3rd Qu.:-0.07836
fbodyacc_std_z :  180 | WALKING_UPSTAIRS  :1980 | Max.   :30.0 | Max.   : 0.97451

###Variable 1: variable
This variable represents a measurement of mean or standard deviation from the 
original data set.  

- Class of the variable: factor<BR>
- Unique values/levels of the variable: Factor w/ 66 levels "fbodyacc_mean_x",
..:<BR>
- Unit of measurement: none<BR>

The benefit of the tall narrow tidy data set is that it bypasses the need to
define the bajillion 66 variables needed in the short wide tidy data set. In the
prior peer review, reviewers thought this method cheated because the data found
under 'variable' was not transformed. The course project requirements required
transformation of variables to descriptive variables, not also transformation of
the data under the descriptive variables. In this rewrite, I elected to prettify
the values under 'variable', removing '()-', '...', '..', '.', and '-' and 
replacing those values with '_'. This provides a prettier data presentation 
while maintaining a clear relationship to the data definition found in 
'features.txt' and 'features_info.txt'. I considered transforming the data 
further like 'time body acceleration mean X axis' or 
'frequency body acceleration mean X axis', but found for some measurements the lengthened data name became annoyingly long and quite possibly error prone in 
transformation. So I kept things short and punchy. Benefits include easier 
relatability back to the 'features.txt' and 'features_info.txt' original data definition.

Feature measurements were transformed as follows:<BR>

Unit of measurement | features.txt label | variable | time or frequency | body or gravity | what was measured | applied function | axis
------------------- | ------------------ | -------- | ----------------- | --------------- | ----------------- | ---------------- | ----
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-mean()-X | fbodyacc_mean_x | frequency | body | acceleration | mean | x
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-mean()-Y | fbodyacc_mean_y | frequency | body | acceleration | mean | y
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-mean()-Z | fbodyacc_mean_z | frequency | body | acceleration | mean | z
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-std()-X | fbodyacc_std_x | frequency | body | acceleration | standard deviation | x
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-std()-Y | fbodyacc_std_y | frequency | body | acceleration | standard deviation | y
standard gravity units 'g' (normalized to [-1,1]) | fBodyAcc-std()-Z | fbodyacc_std_z | frequency | body | acceleration | standard deviation | z
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-mean()-X | fbodyaccjerk_mean_x | frequency | body | acceleration jerk | mean | x
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-mean()-Y | fbodyaccjerk_mean_y | frequency | body | acceleration jerk | mean | y
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-mean()-Z | fbodyaccjerk_mean_z | frequency | body | acceleration jerk | mean | z
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-std()-X | fbodyaccjerk_std_x | frequency | body | acceleration jerk | standard deviation | x
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-std()-Y | fbodyaccjerk_std_y | frequency | body | acceleration jerk | standard deviation | y
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccJerk-std()-Z | fbodyaccjerk_std_z | frequency | body | acceleration jerk | standard deviation | z
radians/second (normalized to [-1,1]) | fBodyGyro-mean()-X | fbodygyro_mean_x | frequency | body | gyroscope | mean | x
radians/second (normalized to [-1,1]) | fBodyGyro-mean()-Y | fbodygyro_mean_y | frequency | body | gyroscope | mean | y
radians/second (normalized to [-1,1]) | fBodyGyro-mean()-Z | fbodygyro_mean_z | frequency | body | gyroscope | mean | z
radians/second (normalized to [-1,1]) | fBodyGyro-std()-X | fbodygyro_std_x | frequency | body | gyroscope | standard deviation | x
radians/second (normalized to [-1,1]) | fBodyGyro-std()-Y | fbodygyro_std_y | frequency | body | gyroscope | standard deviation | y
radians/second (normalized to [-1,1]) | fBodyGyro-std()-Z | fbodygyro_std_z | frequency | body | gyroscope | standard deviation | z
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccMag-mean() | fbodyaccmag_mean_ | frequency | body | acceleration magnitude | mean | N/A
standard gravity units 'g' (normalized to [-1,1]) | fBodyAccMag-std() | fbodyaccmag_std_ | frequency | body | acceleration magnitude | standard deviation | N/A
total acceleration minus g | fBodyBodyAccJerkMag-mean() | fbodybodyaccjerkmag_mean_ | frequency | body | body acceleration jerk magnitude | mean | N/A
total acceleration minus g | fBodyBodyAccJerkMag-std() | fbodybodyaccjerkmag_std_ | frequency | body | body acceleration jerk magnitude | standard deviation | N/A
radians/second (normalized to [-1,1]) | fBodyBodyGyroMag-mean() | fbodybodygyromag_mean_ | frequency | body | body gyroscope magnitude | mean | N/A
radians/second (normalized to [-1,1]) | fBodyBodyGyroMag-std() | fbodybodygyromag_std_ | frequency | body | body gyroscope magnitude | standard deviation | N/A
radians/second (normalized to [-1,1]) | fBodyBodyGyroJerkMag-mean() | fbodybodygyrojerkmag_mean_ | frequency | body | body gyroscope jerk magnitude | mean | N/A
radians/second (normalized to [-1,1]) | fBodyBodyGyroJerkMag-std() | fbodybodygyrojerkmag_std_ | frequency | body | body gyroscope jerk magnitude | standard deviation | N/A
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-mean()-X | tbodyacc_mean_x | time | body | acceleration | mean | x
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-mean()-Y | tbodyacc_mean_y | time | body | acceleration | mean | y
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-mean()-Z | tbodyacc_mean_z | time | body | acceleration | mean | z
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-std()-X | tbodyacc_std_x | time | body | acceleration | standard deviation | x
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-std()-Y | tbodyacc_std_y | time | body | acceleration | standard deviation | y
standard gravity units 'g' (normalized to [-1,1]) | tBodyAcc-std()-Z | tbodyacc_std_z | time | body | acceleration | standard deviation | z
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-mean()-X | tbodyaccjerk_mean_x | time | body | acceleration jerk | mean | x
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-mean()-Y | tbodyaccjerk_mean_y | time | body | acceleration jerk | mean | y
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-mean()-Z | tbodyaccjerk_mean_z | time | body | acceleration jerk | mean | z
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-std()-X | tbodyaccjerk_std_x | time | body | acceleration jerk | standard deviation | x
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-std()-Y | tbodyaccjerk_std_y | time | body | acceleration jerk | standard deviation | y
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerk-std()-Z | tbodyaccjerk_std_z | time | body | acceleration jerk | standard deviation | z
radians/second (normalized to [-1,1]) | tBodyGyro-mean()-X | tbodygyro_mean_x | time | body | gyroscope | mean | x
radians/second (normalized to [-1,1]) | tBodyGyro-mean()-Y | tbodygyro_mean_y | time | body | gyroscope | mean | y
radians/second (normalized to [-1,1]) | tBodyGyro-mean()-Z | tbodygyro_mean_z | time | body | gyroscope | mean | z
radians/second (normalized to [-1,1]) | tBodyGyro-std()-X | tbodygyro_std_x | time | body | gyroscope | standard deviation | x
radians/second (normalized to [-1,1]) | tBodyGyro-std()-Y | tbodygyro_std_y | time | body | gyroscope | standard deviation | y
radians/second (normalized to [-1,1]) | tBodyGyro-std()-Z | tbodygyro_std_z | time | body | gyroscope | standard deviation | z
radians/second (normalized to [-1,1]) | tBodyGyroJerk-mean()-X | tbodygyrojerk_mean_x | time | body | gyroscope jerk | mean | x
radians/second (normalized to [-1,1]) | tBodyGyroJerk-mean()-Y | tbodygyrojerk_mean_y | time | body | gyroscope jerk | mean | y
radians/second (normalized to [-1,1]) | tBodyGyroJerk-mean()-Z | tbodygyrojerk_mean_z | time | body | gyroscope jerk | mean | z
radians/second (normalized to [-1,1]) | tBodyGyroJerk-std()-X | tbodygyrojerk_std_x | time | body | gyroscope jerk | standard deviation | x
radians/second (normalized to [-1,1]) | tBodyGyroJerk-std()-Y | tbodygyrojerk_std_y | time | body | gyroscope jerk | standard deviation | y
radians/second (normalized to [-1,1]) | tBodyGyroJerk-std()-Z | tbodygyrojerk_std_z | time | body | gyroscope jerk | standard deviation | z
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccMag-mean() | tbodyaccmag_mean_ | time | body | acceleration magnitude | mean | N/A
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccMag-std() | tbodyaccmag_std_ | time | body | acceleration magnitude | standard deviation | N/A
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerkMag-mean() | tbodyaccjerkmag_mean_ | time | body | acceleration jerk magnitude | mean | N/A
standard gravity units 'g' (normalized to [-1,1]) | tBodyAccJerkMag-std() | tbodyaccjerkmag_std_ | time | body | acceleration jerk magnitude | standard deviation | N/A
radians/second (normalized to [-1,1]) | tBodyGyroMag-mean() | tbodygyromag_mean_ | time | body | gyroscope magnitude | mean | N/A
radians/second (normalized to [-1,1]) | tBodyGyroMag-std() | tbodygyromag_std_ | time | body | gyroscope magnitude | standard deviation | N/A
radians/second (normalized to [-1,1]) | tBodyGyroJerkMag-mean() | tbodygyrojerkmag_mean_ | time | body | gyroscope jerk magnitude | mean | N/A
radians/second (normalized to [-1,1]) | tBodyGyroJerkMag-std() | tbodygyrojerkmag_std_ | time | body | gyroscope jerk magnitude | standard deviation | N/A
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-mean()-X | tgravityacc_mean_x | time | gravity | acceleration | mean | x
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-mean()-Y | tgravityacc_mean_y | time | gravity | acceleration | mean | y
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-mean()-Z | tgravityacc_mean_z | time | gravity | acceleration | mean | z
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-std()-X | tgravityacc_std_x | time | gravity | acceleration | standard deviation | x
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-std()-Y | tgravityacc_std_y | time | gravity | acceleration | standard deviation | y
standard gravity units 'g' (normalized to [-1,1]) | tGravityAcc-std()-Z | tgravityacc_std_z | time | gravity | acceleration | standard deviation | z
standard gravity units 'g' (normalized to [-1,1]) | tGravityAccMag-mean() | tgravityaccmag_mean_ | time | gravity | acceleration magnitude | mean | N/A
standard gravity units 'g' (normalized to [-1,1]) | tGravityAccMag-std() | tgravityaccmag_std_ | time | gravity | acceleration magnitude | standard deviation | N/A

###Variable 2: activity_label
This variable describes 6 defined physical activities measured by humans wearing 
motion sensing mobile computing devices. The raw data had this information
notated by the numbers 1 through 6. These description labels were created by 
merging data with the activity IDs and activity descriptions.

- Class of the variable: factor<BR>
- Unique values/levels of the variable: LAYING, SITTING, STANDING, WALKING,
 WALKING_DOWNSTAIRS, WALKINGUPSTAIRS<BR>
- Unit of measurement: none<BR>

###Variable 3: subject_id
This variable describes one of the 30 human test volunteers within an age 
bracket of 19-48 years. Each person performed all six activities identified in
variable 1.

- Class of the variable: integer<BR>
- Unique values/levels of the variable: integers 1 through 30<BR>
- Unit of measurement: none<BR>

###Variable 4: mean
The values under this variable represent the mean of each variable, activity,
and subject in the tidy data set. 

##References
- Code book template: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41<BR>
- Hadley Wickham, Tidy Data, pg. 7: http://vita.had.co.nz/papers/tidy-data.pdf
- David Hood, Getting and Cleaning the Assignment, sub-section Bonus Round: Easy 
Marking https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
- Machine Learning Repository, Smartphone-Based Recognition of Human Activities
and Postural Transitions Data Set, https://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions

---
title: "Codebook"
author: "Audrey Julian"
date: "2015/Nov/20"
output:
  html_document:
    keep_md: yes
    toc: yes
    toc_depth: 3
---

<span style="color:red">NOTE: As per the evaluation rubric on Coursera, a tidy
dataset may EITHER be a wide or a long (narrow) form of the data is acceptable.
Per my reading, most students go for a wide tidy data set while I opted for a 
long (narrow) form as described by Hadley Wickham in his tidy data PDF, page 7,
table B entitled Molten data. See References for URL to the PDF of his work. 
The course TAs recommended to students who opted for the long (narrow) tidy 
data set to emphasize that this method is acceptable per the course 
rubrik. Reference this recommendation noted in TA's thoughtfulbloke blog.
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
other platforms or platforms with comparatively inferior hardware specification.

- Hardware: Windows PC
- Operating system: Windows 8.1 Pro
- Processor: Intel(R) Core(TM) i5-2450M CPU @ 2.50 Ghz
- RAM: 8.00 GB
- System type: 64-bit OS, x64-based processor

- Language: R version 3.2.2, 64-bit
- IDE: Version 0.99.485 - © 2009-2015 RStudio, Inc.
- Dependancies: Java Version 8 Update 65 (build 1.8.0_65-b17)

###Installed R Packages, Versions, and Builds
The following R Packages are presumed required to execute the referenced R
functions. If errors are encountered while using these functions, compare run 
environment package list against this comma separated list of development
environment packages for missing packages. Install missing packages in run 
environment and then rerun functions. Code for generating a package list is as
follows:

`packageCheck <- installed.packages()`
`write.table(packageCheck[, c(1, 3, 16)], file = "packageCheck.csv", row.names = FALSE)`

Packages marked with ** are known failure points if not loaded to library prior
to the running of functions.

- <b>Package, Version, Build, Dependency</b>
- acepack, 1.3-3.3, 3.2.2
- assertthat, 0.1, 3.2.2
- benchmark, 0.3-6, 3.2.2
- BH, 1.58.0-1, 3.2.2
- BiocInstaller, 1.20.0, 3.2.2
- bitops, 1.0-6, 3.2.2
- caTools, 1.17.1, 3.2.2
- chron, 2.3-47, 3.2.2
- class, 7.3-14, 3.2.2
- colorspace, 1.2-6, 3.2.2
- crayon, 1.3.1, 3.2.2
- curl, 0.9.3, 3.2.2
- data.table, 1.9.6, 3.2.2
- DBI, 0.3.1, 3.2.2
- dichromat, 2.0-0, 3.2.2
- digest, 0.6.8, 3.2.2
- dplyr, 0.4.3, 3.2.2, **
- evaluate, 0.8, 3.2.2
- foreign, 0.8-66, 3.2.2
- formatR, 1.2.1, 3.2.2
- Formula, 1.2-1, 3.2.2
- ggplot2, 1.0.1, 3.2.2
- gridExtra, 2.0.0, 3.2.2
- gsubfn, 0.6-6, 3.2.2
- gtable, 0.1.2, 3.2.2
- highr, 0.5.1, 3.2.2
- Hmisc, 3.17-0, 3.2.2
- htmltools, 0.2.6, 3.2.2
- httpuv, 1.3.3, 3.2.2
- httr, 1.0.0, 3.2.2
- jpeg, 0.1-8, 3.2.2
- jsonlite, 0.9.17, 3.2.2
- knitr, 1.11, 3.2.2
- labeling, 0.3, 3.2.2
- latticeExtra, 0.6-26, 3.2.2
- lazyeval, 0.1.10, 3.2.2
- lubridate, 1.3.3, 3.2.2
- magrittr, 1.5, 3.2.2
- markdown, 0.7.7, 3.2.2
- MASS, 7.3-44, 3.2.2
- memoise, 0.2.1, 3.2.2
- mime, 0.4, 3.2.2
- munsell, 0.4.2, 3.2.2
- nlme, 3.1-122, 3.2.2
- nnet, 7.3-11, 3.2.2
- plyr, 1.8.3, 3.2.2
- praise, 1.0.0, 3.2.2
- proto, 0.3-10, 3.2.2
- psychotools, 0.4-0, 3.2.2
- quantmod, 0.4-5, 3.2.2
- R6, 2.1.1, 3.2.2
- RColorBrewer, 1.1-2, 3.2.2
- Rcpp, 0.12.1, 3.2.2
- RCurl, 1.95-4.7, 3.2.2
- relations, 0.6-6, 3.2.2
- reshape, 0.8.5, 3.2.2, **
- reshape2, 1.4.1, 3.2.2, **
- rhdf5, 2.14.0, 3.2.2
- rJava, 0.9-7, 3.2.2
- rjson, 0.2.15, 3.2.2
- rmarkdown, 0.8.1, 3.2.2
- RMySQL, 0.10.6, 3.2.2
- RSQLite, 1.0.0, 3.2.2
- scales, 0.3.0, 3.2.2
- sets, 1.0-16, 3.2.2
- slam, 0.1-32, 3.2.2
- spatial, 7.3-11, 3.2.2
- sqldf, 0.4-10, 3.2.2
- stringi, 0.5-5, 3.2.2
- stringr, 1.0.0, 3.2.2
- swirl, 2.2.21, 3.2.2
- testthat, 0.11.0, 3.2.2
- tidyr, 0.3.1, 3.2.2, **
- TTR, 0.23-0, 3.2.2
- XLConnect, 0.2-11, 3.2.2
- XLConnectJars, 0.2-9, 3.2.2
- xlsx, 0.5.7, 3.2.2
- xlsxjars, 0.6.1, 3.2.2
- XML, 3.98-1.3, 3.2.2
- xts, 0.9-7, 3.2.2
- yaml, 2.1.13, 3.2.2
- zlibbioc, 1.16.0, 3.2.2
- zoo, 1.7-12, 3.2.2
- boot, 1.3-17, 3.2.2
- class, 7.3-13, 3.2.2
- cluster, 2.0.3, 3.2.2
- codetools, 0.2-14, 3.2.2
- foreign, 0.8-65, 3.2.2
- KernSmooth, 2.23-15, 3.2.2
- lattice, 0.20-33, 3.2.2
- MASS, 7.3-43, 3.2.2
- Matrix, 1.2-2, 3.2.2
- mgcv, 1.8-7, 3.2.2
- nlme, 3.1-121, 3.2.2
- nnet, 7.3-10, 3.2.2
- rpart, 4.1-10, 3.2.2
- spatial, 7.3-10, 3.2.2
- survival, 2.38-3, 3.2.2

###Collection of the Raw Data
Data for the course project was download from:

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Unpacking the above zip file creates a directory '...\UCI HAR Dataset\...' into
which the requisite data is unzipped and stored. Unpacked data has the following
directory structure. Per course instruction all files in both test and train
'Inertial Signals' sub-directories have been discarded.

- UCI HAR Dataset/test/<BR>
- UCI HAR Dataset/train/<BR>
- UCI HAR Dataset/test/Inertial Signals/<BR>
- UCI HAR Dataset/train/Inertial Signals/<BR>

Unpacked data files are associated with R data frames internal to the script. 
The data frames have the noted dimension. Outlined as follows:

- <b>Data file, R Data Frame name, Dimensions, Note</b>
- activity_labels.txt, activityLabels, 6 rows by 2 columns<BR>
- features.txt, featuresLabels, 561 rows 2 by columns<BR>
- features_info.txt, Not applicable, Not applicable, not imported into R<BR>
- README.txt, Not applicable, Not applicable, not imported into R<BR>
- subject_test.txt, testSubject, 2947 rows by 1 column<BR>
- X_test.txt, testMeasurements, 2947 rows by 561 columns<BR>
- y_test.txt, testActivities, 2947 rows by 1 column<BR>
- subject_train.txt, trainSubject, 2947 rows by 1 column<BR>
- X_train.txt, trainMeasurements, 2947 rows by 561 columns<BR>
- y_train.txt, trainActivities, 2947 rows by 1 column<BR>

###Notes on the Original Raw Data 
Some feature measurements were determined to be non-unique. I verified with
course staff that these were immaterial as they would be excluded for not
being mean or standard deviation measurements. Noted for thoroughness' sake.

Examples include:

- <b>column, Features Label, After make names</b>
- 303, fBodyAcc-bandsEnergy()-1,8, fBodyAcc.bandsEnergy...1.8
- 317, fBodyAcc-bandsEnergy()-1,8, fBodyAcc.bandsEnergy...1.8.1
- 331 fBodyAcc-bandsEnergy()-1,8, fBodyAcc.bandsEnergy...1.8.2

##Creating the Tidy Datafile

###Guide to Create the Tidy Data File
Follow these steps to create the tidy data file. These steps are described in 
greater detail in this project's README file. Refer to README as needed.

<b>Step 0:</b> Download course project data and unzip.<BR>
<b>Step 1:</b> Set R working directory to unzipped directory 
        "...\\UCI HAR Dataset\\...".<BR>
<b>Step 2:</b> Source R package<BR>
<b>Step 3:</b> Load known dependancies to your environment<BR>
<b>Step 4:</b> Evaluate results in "...\\UCI HAR Dataset\\Write_Data\\".<BR>
<b>Step 5:</b> Clean up artifacts left in Global Environment.<BR>

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
- Finally the script writes the resulting data to 
"...\\UCI HAR Dataset\\Write_data..."<BR>

It is strongly recommended to refer to the README file to understand what
functions are used for each stop of this process.

##Description of the Variables in the Tidy Data Output File
The tidy data file is called 'thisseemstowork.txt' and is located in directory
"...\\UCI HAR Dataset\\Write_data...".

General description of the file including:<BR>
- Dimensions of the dataset: 11,880 rows by 4 columns<BR>
- Summary of the data<BR>

activity.name | subject.id | feature.variable | Variable.Average
------------- | ------------- | ------------- | -------------
LAYING: 1980 | Min.: 1.0 | tBodyAcc.mean...X: 180 | Min.: -0.99767
SITTING: 1980 | 1st Qu.: 8.0 | tBodyAcc.mean...Y: 180 | 1st Qu.: -0.96205
STANDING: 1980 | Median: 15.5 | tBodyAcc.mean...Z: 180 | Median: -0.46989
WALKING: 1980 | Mean: 15.5 | tGravityAcc.mean...X: 180 | Mean: -0.48436
WALKING_DOWNSTAIRS: 1980 | 3rd Qu.: 23.0 | tGravityAcc.mean...Y: 180 | 3rd Qu.: -0.07836
WALKING_UPSTAIRS: 1980 | Max.: 30.0 | Cell 2 | Max.: 0.97451
 _ | _ | (Other):10800 | _

- Variables present in the dataset:<BR>
        - activity.name<BR>
        - subject.id<BR>
        - feature.variable<BR>
        - Variable.Average<BR>

###Variable 1: activity.name
This variable describes 6 defined physical activies measured by humans wearing 
motion sensing mobile computing devices. 

- Class of the variable: factor<BR>
- Unique values/levels of the variable: LAYING, SITTING, STANDING, WALKING,
 WALKING_DOWNSTAIRS, WALKINGUPSTAIRS<BR>
- Unit of measurement: none<BR>

####Notes on variable 1: activity.name
The raw data had this information notated by the numbers 1 through 6. These
description labels were created by merging data with the activity IDs and 
activity descriptions.

###Variable 2: subject.id
This variable describes one of the 30 human test volunteers within an age 
bracket of 19-48 years. Each person performed all six activities identified in
variable 1.

- Class of the variable: integer<BR>
- Unique values/levels of the variable: integers 1 through 30<BR>
- Unit of measurement: none<BR>

###Variable 3: feature.variable
The following is a direct extract from the raw data 'features_info.txt' to 
describe the features in the raw data. My script melts the dataset and stacks 
the feature column measurements into a molten dataset, yielding a long narrow
tidy dataset.

*The features selected for this...[data] come(s) from the accelerometer and* 
*gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain*
*signals (prefix 't' to denote time) were captured at a constant rate of*
*50 Hz. Then they were filtered using a median filter and a 3rd order low pass*
*Butterworth filter with a corner frequency of 20 Hz to remove noise.*
*Similarly, the acceleration signal was then separated into body and gravity* 
*acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low*
*pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived*
*in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).*
*Also the magnitude of these three-dimensional signals were calculated using*
*the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,*
*tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals* 
*producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,*
*fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain*
*signals). These signals were used to estimate variables of the feature vector*
*for each pattern:*

*XYZ is used to denote 3-axial signals in the X, Y and Z directions.*

- Class of the variable: factor<BR>
- The following table lists all levles of the variable, the deconstruction of
the variable to derive its meaning, and the variable's unit of measurement.<BR>
- Features are normalized and bounded within [-1,1].<BR>
- Each feature vector is a row on the 'X' and 'y' files.<BR>
- The units used for the accelerations (total and body) are 'g's (gravity of 
earth -> 9.80665 m/seg2).<BR>
- The gyroscope units are rad/seg.<BR> 

features.txt label | make.names label | Time or Frequency | Body or Gravity | What was Measured | Function Applied | Axis | Unit of measurement
------------------------------------------------ | ---------------------------------------- | -------------------- | -------------------- | ------------------------- | --------------------- | ----- | --------------------------
tBodyAcc-mean()-X | tBodyAcc.mean...X | time | body | acceleration | mean value | x | 9.80665 m/seg2
tBodyAcc-mean()-Y | tBodyAcc.mean...Y | time | body | acceleration | mean value | y | 9.80665 m/seg2
tBodyAcc-mean()-Z | tBodyAcc.mean...Z | time | body | acceleration | mean value | z | 9.80665 m/seg2
tBodyAcc-std()-X | tBodyAcc.std...X | time | body | acceleration | standard deviation | x | 9.80665 m/seg2
tBodyAcc-std()-Y | tBodyAcc.std...Y | time | body | acceleration | standard deviation | y | 9.80665 m/seg2
tBodyAcc-std()-Z | tBodyAcc.std...Z | time | body | acceleration | standard deviation | z | 9.80665 m/seg2
tGravityAcc-mean()-X | tGravityAcc.mean...X | time | gravity | acceleration | mean value | x | 9.80665 m/seg2
tGravityAcc-mean()-Y | tGravityAcc.mean...Y | time | gravity | acceleration | mean value | y | 9.80665 m/seg2
tGravityAcc-mean()-Z | tGravityAcc.mean...Z | time | gravity | acceleration | mean value | z | 9.80665 m/seg2
tGravityAcc-std()-X | tGravityAcc.std...X | time | gravity | acceleration | standard deviation | x | 9.80665 m/seg2
tGravityAcc-std()-Y | tGravityAcc.std...Y | time | gravity | acceleration | standard deviation | y | 9.80665 m/seg2
tGravityAcc-std()-Z | tGravityAcc.std...Z | time | gravity | acceleration | standard deviation | z | 9.80665 m/seg2
tBodyAccJerk-mean()-X | tBodyAccJerk.mean...X | time | body | acceleration jerk | mean value | x | 9.80665 m/seg2
tBodyAccJerk-mean()-Y | tBodyAccJerk.mean...Y | time | body | acceleration jerk | mean value | y | 9.80665 m/seg2
tBodyAccJerk-mean()-Z | tBodyAccJerk.mean...Z | time | body | acceleration jerk | mean value | z | 9.80665 m/seg2
tBodyAccJerk-std()-X | tBodyAccJerk.std...X | time | body | acceleration jerk | standard deviation | x | 9.80665 m/seg2
tBodyAccJerk-std()-Y | tBodyAccJerk.std...Y | time | body | acceleration jerk | standard deviation | y | 9.80665 m/seg2
tBodyAccJerk-std()-Z | tBodyAccJerk.std...Z | time | body | acceleration jerk | standard deviation | z | 9.80665 m/seg2
tBodyGyro-mean()-X | tBodyGyro.mean...X | time | body | gyroscope | mean value | x | rad/seg
tBodyGyro-mean()-Y | tBodyGyro.mean...Y | time | body | gyroscope | mean value | y | rad/seg
tBodyGyro-mean()-Z | tBodyGyro.mean...Z | time | body | gyroscope | mean value | z | rad/seg
tBodyGyro-std()-X | tBodyGyro.std...X | time | body | gyroscope | standard deviation | x | rad/seg
tBodyGyro-std()-Y | tBodyGyro.std...Y | time | body | gyroscope | standard deviation | y | rad/seg
tBodyGyro-std()-Z | tBodyGyro.std...Z | time | body | gyroscope | standard deviation | z | rad/seg
tBodyGyroJerk-mean()-X | tBodyGyroJerk.mean...X | time | body | gyroscope jerk | mean value | x | rad/seg
tBodyGyroJerk-mean()-Y | tBodyGyroJerk.mean...Y | time | body | gyroscope jerk | mean value | y | rad/seg
tBodyGyroJerk-mean()-Z | tBodyGyroJerk.mean...Z | time | body | gyroscope jerk | mean value | z | rad/seg
tBodyGyroJerk-std()-X | tBodyGyroJerk.std...X | time | body | gyroscope jerk | standard deviation | x | rad/seg
tBodyGyroJerk-std()-Y | tBodyGyroJerk.std...Y | time | body | gyroscope jerk | standard deviation | y | rad/seg
tBodyGyroJerk-std()-Z | tBodyGyroJerk.std...Z | time | body | gyroscope jerk | standard deviation | z | rad/seg
tBodyAccMag-mean() | tBodyAccMag.mean.. | time | body | acceleration magnitude | mean value | (no axis) | 9.80665 m/seg2
tBodyAccMag-std() | tBodyAccMag.std.. | time | body | acceleration magnitude | standard deviation | (no axis) | 9.80665 m/seg2
tGravityAccMag-mean() | tGravityAccMag.mean.. | time | gravity | acceleration magnitude | mean value | (no axis) | 9.80665 m/seg2
tGravityAccMag-std() | tGravityAccMag.std.. | time | gravity | acceleration magnitude | standard deviation | (no axis) | 9.80665 m/seg2
tBodyAccJerkMag-mean() | tBodyAccJerkMag.mean.. | time | body | acceleration jerk magnitude | mean value | (no axis) | 9.80665 m/seg2
tBodyAccJerkMag-std() | tBodyAccJerkMag.std.. | time | body | acceleration jerk magnitude | standard deviation | (no axis) | 9.80665 m/seg2
tBodyGyroMag-mean() | tBodyGyroMag.mean.. | time | body | gyroscope magnitude | mean value | (no axis) | rad/seg
tBodyGyroMag-std() | tBodyGyroMag.std.. | time | body | gyroscope magnitude | standard deviation | (no axis) | rad/seg
tBodyGyroJerkMag-mean() | tBodyGyroJerkMag.mean.. | time | body | gyroscope jerk magnitude | mean value | (no axis) | rad/seg
tBodyGyroJerkMag-std() | tBodyGyroJerkMag.std.. | time | body | gyroscope jerk magnitude | standard deviation | (no axis) | rad/seg
fBodyAcc-mean()-X | fBodyAcc.mean...X | frequency | body | acceleration | mean value | x | 9.80665 m/seg2
fBodyAcc-mean()-Y | fBodyAcc.mean...Y | frequency | body | acceleration | mean value | y | 9.80665 m/seg2
fBodyAcc-mean()-Z | fBodyAcc.mean...Z | frequency | body | acceleration | mean value | z | 9.80665 m/seg2
fBodyAcc-std()-X | fBodyAcc.std...X | frequency | body | acceleration | standard deviation | x | 9.80665 m/seg2
fBodyAcc-std()-Y | fBodyAcc.std...Y | frequency | body | acceleration | standard deviation | y | 9.80665 m/seg2
fBodyAcc-std()-Z | fBodyAcc.std...Z | frequency | body | acceleration | standard deviation | z | 9.80665 m/seg2
fBodyAccJerk-mean()-X | fBodyAccJerk.mean...X | frequency | body | acceleration jerk | mean value | x | 9.80665 m/seg2
fBodyAccJerk-mean()-Y | fBodyAccJerk.mean...Y | frequency | body | acceleration jerk | mean value | y | 9.80665 m/seg2
fBodyAccJerk-mean()-Z | fBodyAccJerk.mean...Z | frequency | body | acceleration jerk | mean value | z | 9.80665 m/seg2
fBodyAccJerk-std()-X | fBodyAccJerk.std...X | frequency | body | acceleration jerk | standard deviation | x | 9.80665 m/seg2
fBodyAccJerk-std()-Y | fBodyAccJerk.std...Y | frequency | body | acceleration jerk | standard deviation | y | 9.80665 m/seg2
fBodyAccJerk-std()-Z | fBodyAccJerk.std...Z | frequency | body | acceleration jerk | standard deviation | z | 9.80665 m/seg2
fBodyGyro-mean()-X | fBodyGyro.mean...X | frequency | body | gyroscope | mean value | x | rad/seg
fBodyGyro-mean()-Y | fBodyGyro.mean...Y | frequency | body | gyroscope | mean value | y | rad/seg
fBodyGyro-mean()-Z | fBodyGyro.mean...Z | frequency | body | gyroscope | mean value | z | rad/seg
fBodyGyro-std()-X | fBodyGyro.std...X | frequency | body | gyroscope | standard deviation | x | rad/seg
fBodyGyro-std()-Y | fBodyGyro.std...Y | frequency | body | gyroscope | standard deviation | y | rad/seg
fBodyGyro-std()-Z | fBodyGyro.std...Z | frequency | body | gyroscope | standard deviation | z | rad/seg
fBodyAccMag-mean() | fBodyAccMag.mean.. | frequency | body | acceleration magnitude | mean value | (no axis) | 9.80665 m/seg2
fBodyAccMag-std() | fBodyAccMag.std.. | frequency | body | acceleration magnitude | standard deviation | (no axis) | 9.80665 m/seg2
fBodyBodyAccJerkMag-mean() | fBodyBodyAccJerkMag.mean.. | frequency | body | body acceleration jerk magnitude | mean value | (no axis) | 9.80665 m/seg2
fBodyBodyAccJerkMag-std() | fBodyBodyAccJerkMag.std.. | frequency | body | body acceleration jerk magnitude | standard deviation | (no axis) | 9.80665 m/seg2
fBodyBodyGyroMag-mean() | fBodyBodyGyroMag.mean.. | frequency | body | body gyroscope magnitude | mean value | (no axis) | rad/seg
fBodyBodyGyroMag-std() | fBodyBodyGyroMag.std.. | frequency | body | body gyroscope magnitude | standard deviation | (no axis) | rad/seg
fBodyBodyGyroJerkMag-mean() | fBodyBodyGyroJerkMag.mean.. | frequency | body | body gyroscope jerk magnitude | mean value | (no axis) | rad/seg
fBodyBodyGyroJerkMag-std() | fBodyBodyGyroJerkMag.std.. | frequency | body | body gyroscope jerk magnitude | standard deviation | (no axis) | rad/seg

####Notes on variable 3: feature.variable
<span style="color:red">
Raw data used the values in 'Label in features.txt File' column were transformed
using the make.names function in R to create unique variable names noted in
table 'Label after make.names'. Note that while other mean variables were
included in the raw data, such as meanFreq, project course specifications
included only mean and standard deviation measures. Since the raw data
documentation had high quality data definition documentation, with mean and
mean frequency being explicitly different measurements, for the purpose of this 
project I have excluded meanFreq meansurements.</span>

Units of measurement was determined from the Machine Learning Repository, 
Smartphone-Based Recognition of Human Activities and Postural Transitions Data 
Set, URL noted in the References section.

###Variable 4: Variable.Average
Per each feature variable identified in variable 3, a mean is calculated for 
each activity and each subject. As multiple measurements were recorded for each
activity, subject, and variable, this is the average of the measurement.

- Class of the variable: numeric<BR>
- Unique values/levels of the variable: none<BR>
- Unit of measurement: refer to variable 3 for the unit of measurement this
 number represents.<BR>

##Sources
Sources you used if any, otherise leave out.

##References
- Code book template: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41<BR>
- Hadley Wickham, Tidy Data, pg. 7: http://vita.had.co.nz/papers/tidy-data.pdf
- David Hood, Getting and Cleaning the Assignment, sub-section Bonus Round: Easy 
Marking https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
- Machine Learning Repository, Smartphone-Based Recognition of Human Activities
and Postural Transitions Data Set, https://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions

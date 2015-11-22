---
title: "README"
author: "Audrey Julian"
date: "2015/Nov/20"
output:
  html_document:
    keep_md: yes
    toc: yes
    toc_depth: 3
---

#Overview
To evaluate my work for the Getting and Cleaning Data course project, follow
these steps. Note "..." indicates the pathway in your environment to a directory
or object. If the working directory set correctly in step 1, this script reads
specific files from the working directory and reassembles into a tidy data set,
available for review as noted in steps 4 & 5. Note, this script creates a 
'Write_Data' directory under the working directory. This script writes data only
to this created directory. If you need to run this script a second time, please
manually delete 'Write_Data' directory prior to running the script a second
time.

The course project is described in detail here:

https://class.coursera.org/getdata-034/human_grading<BR>
https://class.coursera.org/getdata-034/human_grading/view/courses/975118/assessments/3/submissions<BR>

# Course Project Steps
The course project assignment requires the following steps to be performed. 
Create one R script called run_analysis.R that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each 
measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with
the average of each variable for each activity and each subject.

In addition to this R script, the assignment requires a CodeBook and ReadMe 
file. This document serves as the ReadMe file. The CodeBook may be found in
GitHub.

#Outline of the processing steps
Follow these steps to evaluate my script:

<b>Step 0:</b> Download course project data and unzip. After unzipping do not 
        modify, move, rename, or delete any element of the unzipped directory 
        structure. Do not modify, move, rename, or delete any unzipped files. If
        you have not already downloaded the course project zip file, copy and 
        paste the following lines into the R console:
        
```
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl1, "projectdata.zip")
unzip("projectdata.zip")
```

<b>Step 1:</b> Set R working directory to unzipped directory 
        "...\\UCI HAR Dataset\\...". Please determine the pathway to this 
        unzipped directory and pass the required command to R console using the
        setwd() command.

<b>Step 2:</b> Source R package by running "source('...\\run_analysis.r')"

<b>Step 3:</b> Copy and paste the following lines into the R console to add 
        known dependencies to your environment. You will need to download these
        packages to your environment if you haven't already done so, prior to 
        running these commands.

```        
library(dplyr)
library(reshape)
library(tidyr)
run_analysis()
```



<b>Step 4:</b> Evaluate results in "...\\UCI HAR Dataset\\Write_Data\\". Two 
        formats available, 'thisseemstowork.txt' or 'thisseemstowork.csv', 
        contents of both files the same. To view the file output in R, copy and 
        paste the following line into the R console:

```
GandCData <- read.table("./Write_Data/thisseemstowork.txt", header = TRUE)
View(GandCData)
```

<b>Step 5:</b> Alternatively evaluate results in the global environment variable
        'thisseemstoWork'. Copy and paste the following line into the R console
        to check output.<BR>
<BR>
```
View(thisseemstoWork)
```
<BR>
<b>Step 6:</b> Copy and paste the following lines into the R console to remove
        the created variables from your global environment.<BR>
<BR>
```
rm("thisseemstoWork", "GandCData", "fileUrl1")
```
<BR>
#Assumptions About the Raw Dataset
The script assumes the following about the raw dataset:

- The data stored at the referenced URL is unchanged from time of writing script.
- The directory structure as included in the zip file is unchanged and includes:<BR>
        - UCI HAR Dataset/test/<BR>
        - UCI HAR Dataset/train/<BR>
- The files included in the zip file is unchanged, and includes:<BR>
        - activity_labels.txt<BR>
        - features.txt<BR>
        - subject_test.txt<BR>
        - X_test.txt<BR>
        - y_test.txt<BR>
        - subject_train.txt<BR>
        - X_train.txt<BR>
        - y_train.txt<BR>

#High-level Synopsis of the Processing Steps
Assuming that the above steps are followed and that all script dependencies are
loaded into the R environment prior to running script, the script will:

- Load the files listed under the Assumptions About the Raw Dataset section
using the read.table function.
- Assign measurement variable names based on features.txt using the make.names
function.
- Combine subject, activity, and measurement data by test and train using the 
cbind function.
- Combine test and train data using the rbind function.
- Apply descriptive activity names to the combined data using the merge 
function.
- Dynamically extract mean and standard deviation measurements from combined
data using pattern based grep commands.
- Melt the subset data into a narrow long table following the tidy data
principles as described by Hadley Wickham in his "Tidy Data" essay using the melt
function.
- Cleaned up variable names using the colnames function.
- Group data by activity, subject, measurement variable using group_by 
function.
- Summarize the grouped data with the summarize function by unique activity, 
subject, measurement variable using n_distinct, then calculated the average on 
the in-scope variable measurements using the mean function.
- Finally the script writes the resulting data to 
"...\\UCI HAR Dataset\\Write_data..."

#Citations
Hadley Wickham, Tidy Data, pg. 7, chart (b) Molten Data<BR>
vita.had.co.nz/papers/tidy-data.pdf<BR>

Step 4: Reading lines back into R<BR>
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
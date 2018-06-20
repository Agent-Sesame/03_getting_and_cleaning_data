---
title: "README"
author: "Audrey Julian"
date: "2018/Jun/19"
output:
  html_document:
    keep_md: yes
    toc: yes
    toc_depth: 3
---

#Overview
This is a rewrite of old code submitted to Coursera course John Hopkins Data
Science, Getting and Cleaning Data class. Store this script under a
preferred working directory, and extract the script data to a sub-directory 
'data' under the working directory. Create another sub-directory 'output' to
the same working directory. If reruning the script, delete contents in the 
'output' before running a second time. 

The original course project is described in detail here:

https://class.coursera.org/getdata-034/human_grading<BR>
https://class.coursera.org/getdata-034/human_grading/view/courses/975118/assessments/3/submissions<BR>

The course project refers to this source:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Course Project Steps
The course project assignment requires the following steps to be performed. 
Create one R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only mean and standard deviation measurements from the data set.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names. 
* Then create a second, independent tidy data set with the average of each 
variable for each activity and each subject.

In addition to this R script, the assignment requires a CodeBook and ReadMe 
file. This document serves as the ReadMe file. The CodeBook may be found in
GitHub.

#Outline of the processing steps
Follow these steps to evaluate my script:

<b>Step 0:</b> Download course project data and unzip. Store data under working
        directory sub-directory 'data'. Do not modify, move, rename, or delete 
        any element of the unzipped directory structure and file names. If
        you have not already downloaded the course project zip file, from inside
        the working directory, copy and paste the following lines into the R 
        console:
        
```
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl1, "projectdata.zip")
unzip("projectdata.zip")
```

<b>Step 1:</b> Under working directory, create sub-directory 'data', then move 
        unzipped files to the 'data' sub-directory. 

<b>Step 2:</b> Source script by copying and pasting this code to console.

```
source('./run_analysis.R')
```

<b>Step 3:</b> Add script dependancies by copying and pasting code to console.

```        
install.packages("reshape")
install.packages("dplyr")
run_analysis()
```

<b>Step 4:</b> Evaluate results in working direcotry "./output" sub-directories,
        "tidysummarizedata.csv" and "tidysummarizedata.txt". To view the file 
        output in R, copy and paste the following line into the R console:

```
tidydf <- read.table("./tidysummarizedata.txt", header = TRUE)
View(tidydf)
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

* Load the files listed under the Assumptions About the Raw Dataset section.
* Assign and prettify measurement variable names based on features.txt.
* Combine subject, activity, and measurement data from test and train data.
* Combine test and train data.
* Apply descriptive activity names to the combined data.
* Extract only mean and standard deviation measurements from combined data.
* Melt data into a narrow long table following the tidy data principles as 
described by Hadley Wickham in his "Tidy Data" essay.
* Group data by measurement variable, activity, and subject.
* Summarize the average of the grouped data.
* Finally the script writes the resulting data to "./output"

#Citations
Hadley Wickham, Tidy Data, pg. 7, chart (b) Molten Data<BR>
http://vita.had.co.nz/papers/tidy-data.pdf<BR>

Step 4: Reading lines back into R<BR>
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

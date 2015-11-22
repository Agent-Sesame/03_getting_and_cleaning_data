run_analysis <- function() {

        ## The following lines of code import data from UCI Har Dataset
        ## identified necessary for getting and cleaning the wearable computing
        ## data.
        
        activityLabels <- read.table("activity_labels.txt", sep = " ", 
                header = FALSE, col.names = c("field.activityLabelsid", 
                "field.activityLabel"))

        featuresLabels <- read.table("features.txt", sep = " " , 
                header = FALSE, col.names = c("field.featuresLabelsid", 
                "field.featuresLabel"))

        ## Create unique measurement variable names based on featuresLables
        ## variable content.
        
        variableLabel <- make.names(as.vector(featuresLabels[, 2]), 
                unique = TRUE)

        ## Continue importing data from UCI Har Dataset identified necessary for
        ## getting and cleaning the wearable computing data.
        
        testSubject <- read.table("./test/subject_test.txt", sep = " " ,
                header = FALSE, col.names = "field.personID")

        testActivities <- read.table("./test/y_test.txt", sep = " " , 
                header = FALSE, col.names = "field.activityLabelsid")

        testMeasurements <- read.table("./test/X_test.txt", header = FALSE, 
                col.names = variableLabel)

        trainSubject <- read.table("./train/subject_train.txt", sep = " " , 
                header = FALSE, col.names = "field.personID")

        trainActivities <- read.table("./train/y_train.txt", sep = " " ,
                header = FALSE, col.names = "field.activityLabelsid")

        trainMeasurements <- read.table("./train/X_train.txt", header = FALSE, 
                col.names = variableLabel)

        ## Stitch together test subject, activity and measurement data using 
        ## cbind. Row dimensions for these files equal.
        
        testData <- cbind(testSubject, testActivities, testMeasurements)

        ## Stitch together training subject, activity and measurement data using 
        ## cbind. Row dimensions for these files equal.
        
        trainData <- cbind(trainSubject, trainActivities, trainMeasurements)

        ## Add source indicator to testData and trainData prior to rbind-ing.
        
        trainType <- as.data.frame(c(rep("test", dim(testSubject)[1]), 
                rep("train", dim(trainSubject)[1])))

        ## Name source name 'data.type'
        
        colnames(trainType) <- "data.type"

        ## Stitch together rbind-ed testData & trainData. Column dimensions the
        ## same. cbind data source indicator to this data. Row diminensions the
        ## same.
        
        allData <- cbind(trainType, rbind(testData, trainData))

        ## Merge allactivityData with the descriptive label names for the
        ## activity ID.
        
        allactivityData <- merge(allData, activityLabels, 
                by = "field.activityLabelsid")

        ## Identify column numbers that need to be extracted from the larger
        ## data set using grep. Benefits from this method allows for dynamic
        ## extraction of in-scope data without respect to column position in the
        ## larger data set.
        
        meanstdVariable <- c(grep("data.type", names(allactivityData),
                fixed = TRUE),
                grep("field.personID", names(allactivityData), fixed = TRUE),
                grep("field.activityLabel", names(allactivityData), fixed = TRUE),
                grep("mean\\.", names(allactivityData)),
                grep("std..", names(allactivityData)))
 
        ## Subset allactivityData using the vector created by meanstdVariable.
        
        meanstdData <- allactivityData[meanstdVariable]

        ## next step requires library(reshape)

        meltmeanstdData <- melt(meanstdData, id=c("data.type","field.personID",
                "field.activityLabelsid", "field.activityLabel"))

        ## Set final data variable names.
        
        finalvariableNames <- c("data.type", "subject.id", "activity.id", 
                "activity.name", "feature.variable", "feature.measurement")
        
        ## Update meltmeanstdData variable names to finalvariableNames
        
        colnames(meltmeanstdData) <- finalvariableNames

        ## Create directory into which the remainder of this code will write 
        ## files
              
        dir.create("Write_Data")

        ## Group by Activity, Subject
        
        groupedmeltdata <- group_by(meltmeanstdData, activity.name, 
                subject.id, feature.variable)
        
        ## Then calculate the average of each variable
        
        doesthiswork <- summarize(groupedmeltdata,
                                  Activity = n_distinct(activity.name),
                                  Subject = n_distinct(subject.id),
                                  Variable = n_distinct(feature.variable),
                                  Variable.Average = mean(feature.measurement))

        ## Write the output to directory. 
                
        thisseemstoWork <<- doesthiswork[, c(1, 2, 3, 7)]
        
        write.table(doesthiswork[, c(1, 2, 3, 7)], 
                  file = "./Write_Data/thisseemstowork.csv",
                  row.names = FALSE)
        write.table(doesthiswork[, c(1, 2, 3, 7)],
                  file = "./Write_Data/thisseemstowork.txt",
                  row.names = FALSE)
}
run_analysis <- function() {

  # load required packages in namespace

  library(reshape)
  library(dplyr)

  # Import UCI Har Dataset static data under directory 'data'

  setwd("./data")

  activity_labels <- read.table("activity_labels.txt",
                               sep = " ",
                               header = FALSE,
                               col.names = c("activity_id",
                                             "activity_label"))

  features_labels <- read.table("features.txt",
                                sep = " ",
                                header = FALSE,
                                col.names = c("features_id",
                                             "features_label"))

  # modify features lables for lintable, descriptive variable names

  descriptive_labels <- as.vector(features_labels$features_label)
  descriptive_labels <- gsub("()-", "_", descriptive_labels, fixed = TRUE)
  descriptive_labels <- gsub("()", "_", descriptive_labels, fixed = TRUE)
  descriptive_labels <- gsub("-", "_", descriptive_labels, fixed = TRUE)
  descriptive_labels <- tolower(descriptive_labels)
  descriptive_labels <- as.data.frame(descriptive_labels)

  features_labels <- bind_cols(features_labels, descriptive_labels)

  # Create unique measurement variables from features_lables variable content

  variable_label <- make.names(as.vector(features_labels[, 3]), unique = TRUE)

  # Import data from UCI Har Dataset wearable computing data

  test_subject <- read.table("./test/subject_test.txt",
                            sep = " ",
                            header = FALSE,
                            col.names = "subject_id")

  test_activities <- read.table("./test/y_test.txt",
                                sep = " ",
                                header = FALSE,
                                col.names = "activity_id")

  test_measurements <- read.table("./test/X_test.txt",
                                  header = FALSE,
                                  col.names = variable_label)

  train_subject <- read.table("./train/subject_train.txt",
                             sep = " ",
                             header = FALSE,
                             col.names = "subject_id")

  train_activities <- read.table("./train/y_train.txt",
                                 sep = " ",
                                 header = FALSE,
                                 col.names = "activity_id")

  train_measurements <- read.table("./train/X_train.txt",
                                  header = FALSE,
                                  col.names = variable_label)

  # Combine test subject, activity and measurement data

  test_data <- cbind(test_subject, test_activities, test_measurements)

  # Comibine training subject, activity and measurement data

  train_data <- cbind(train_subject, train_activities, train_measurements)

  # Add source indicator to test_data and train_data prior to rbind-ing.

  train_type <- as.data.frame(c(rep("test", dim(test_subject)[1]),
                                rep("train", dim(train_subject)[1])))

  # Name source name 'data.type'

  colnames(train_type) <- "data_type"

  # Combine test_data & train_data with rbind with source indicator by cbind

  dat <- cbind(train_type, rbind(test_data, train_data))

  # Merge all_activity_data and descriptive label names for the activity ID

  dat <- merge(dat, activity_labels, by = "activity_id")

  # Use grep to pattern match, list the column numbers for mean and standard
  # deviation data to extract only those measurements from the larger data set.
  # This method allows for dynamic extraction of in-scope data without
  # respect to column position in the larger data set.

  mean_std_variables <- c(grep("data_type", names(dat), fixed = TRUE),
                          grep("subject_id", names(dat), fixed = TRUE),
                          grep("activity_label", names(dat), fixed = TRUE),
                          grep("_mean_", names(dat)),
                          grep("_std_", names(dat)))

  # subset all_activity_data using vector mean_std_variables.

  dat <- dat[mean_std_variables]

  # reshape data to be tall and skinny instead of short and fat

  dat <- melt.data.frame(dat,
                         id = c("data_type", "subject_id", "activity_label"))

  # group by variable, activity, subject id

  tidydf <- group_by(dat, variable, activity_label, subject_id)

  # calculate average of each variable for each activity and each subject

  tidydf <- tidydf %>% summarise(mean = mean(value))

  # change working diretory to write the output file

  setwd("..")
  setwd("./output")
  write.table(tidydf, file = "./tidysummarizedata.csv", row.names = FALSE)
  write.table(tidydf, file = "./tidysummarizedata.txt", row.names = FALSE)
  
  # return working directory to one level up
  
  setwd("..")
}

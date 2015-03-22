# set working directory
getwd()
setwd("C:/Users/Nu/Downloads/DataScientist/GettingandCleaningData/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# read column labels
features <- read.csv("./features.txt", stringsAsFactors=FALSE, sep = "",header = FALSE)

# read activities
activities <- read.csv("./activity_labels.txt", stringsAsFactors=FALSE, sep = "",header = FALSE)

# read X_train, subject_train, and y_train data into R
# seperate columns by space and no header
train <- read.csv("./train/X_train.txt", sep = "", header = FALSE)
train_subject <- read.csv("./train/subject_train.txt", header = FALSE)
train_activity <- read.csv("./train/y_train.txt", header = FALSE)

# read X_test, subject_test, and y_test data into R
# seperate columns by space and no header
test <- read.csv("./test/X_test.txt", sep = "", header = FALSE)
test_subject <- read.csv("./test/subject_test.txt", header = FALSE)
test_activity <- read.csv("./test/y_test.txt", header = FALSE)

# merge train, train_subject, and train_activity data by columns
# result in total_train data frame
total_train <- cbind(train_subject,train_activity,train)

# merge test, test_subject, and test_activity data by columns
# result in total_test data frame
total_test <- cbind(test_subject,test_activity,test)

# merge the total_training and total_test data frames by rows.
# result data frame 'total' with 10299 rows and 563 columns
total <- rbind(total_train,total_test)

# name columns of total data frame
colnames(total) <- c("subject","activity",features$V2)

# name activities as in activity_labels.txt
for (n in 1:length(total$activity)){
    total[n,2] <- activities[total[n,2],2]
}

# pick the columns which return the mean and standard deviation for each measurement
total_features <- read.csv("./features.txt", stringsAsFactors=FALSE, sep = "-",header = FALSE)
total_mean_std_column <- c("1", "2", which(total_features$V2 == "mean()" | total_features$V2 == "std()") + 2)

# subset total with the columns which only return the mean and standard deviation for each measurement
total_mean_std <- total[,as.numeric(total_mean_std_column)]

install.packages("dplyr")
library(dplyr)

# group total_mean_std data by subject and activity
total_subject_activity <- group_by (total_mean_std, subject, activity)
tidy_data <- summarise_each (total_subject_activity,funs(mean))

# rename the tidy_data columns
colnames(tidy_data) <- paste("mean", colnames(tidy_data), sep = "_")
names(tidy_data)[names(tidy_data) == "mean_activity"] <- "activity"
names(tidy_data)[names(tidy_data) == "mean_subject"] <- "subject"

# create a .txt file from tidy_data
write.table(tidy_data,"Lu_project_tidy_data.txt",col.names = TRUE, row.names = FALSE)

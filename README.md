# getting-and-cleaning-data-project

## This repo contains

### 1. The r code to perform the requested 5 steps and generate the tidy data set called tidy_data
### 2. The readme file which explains how the code works
### 3. The code book which explains each variable in the tidy data frame.

## How the run_analysis.r code works

### 1. It first defines the working directory, where the raw data files and r code are saved.
### 2. Read the downloaded data files including:
####   a) features: the features being recorded
####   b) activities: the 6 activities being performed by the 30 subjects
####   c) train data set: the recorded feature data per train subject and activity
####   d) test data set: the recorded feature data per test subject and activity
### 3. Merge train data set and test data set by rows which results in the 'total' data frame.
### 4. Name the columns of the 'total' data frame by the features
### 5. Rename the activity index by the activity names
### 6. Pick the columns which return the mean and standard deviation for each meansurement, resulting in another data frame called 'total_mean_std'
### 7. Create the required tidy data set with the mean of each feature variable in the 'total_mean_std' data set by subject and activity
### 8. Name the columns of final 'tidy_data' data frame
### 9. Save the 'tidy_data' data frame into a .txt file

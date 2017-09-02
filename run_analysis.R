#Read all relevant files from the local folder.
setwd("/Users/Imo/Desktop/UCI HAR Dataset")
features <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/features.txt", 
                       header = FALSE, stringsAsFactors = FALSE)
x_test <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/test/X_test.txt", 
                     header =  FALSE)
x_train <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/train/X_train.txt", 
                     header =  FALSE)
y_train <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/train/y_train.txt", 
                      header =  FALSE, colClasses = c("factor"))
y_test <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/test/y_test.txt", 
                     header =  FALSE, colClasses = c("factor"))
subject_test <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/test/subject_test.txt", 
                     header =  FALSE, colClasses = c("numeric"))
subject_train <- read.table("/Users/Imo/Desktop/UCI HAR Dataset/train/subject_train.txt", 
                      header =  FALSE, colClasses = c("numeric"))
# Check dimensions of the data frames before matching up.
dim(features)
dim(x_train)
dim(x_test)
dim(y_train)
dim(y_test)

# Step 1: Merge the x_train and x_test data together, forming a 100% data
new<- rbind(x_train, x_test, stringsAsFactors = FALSE)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#         In the function "grep", "fixed =TRUE" makes sure only exact matchings are made.
c <- grep("mean()", features$V2, fixed = TRUE)
d <- grep("std", features$V2, fixed= TRUE)
e<- sort(c(c,d))
selected <- new[,e]

#Step 3.1: Uses descriptive activity names to name the activities in the data set
#        using the "revalue" function in the "plyr" package 
#        (Rename from number factors to descriptive factors ).
#Step 3.2: Combine "acitivy" and "subject" data to the original extracted data.
library(dplyr)
library(plyr)
library(tidyr)
activity <- rbind(y_train, y_test)
activity$V1 <- revalue(activity$V1, 
                       c("1"="walk","2"="walk up", "3"="walk down",
                         "4"="sit", "5"= "stand", "6"="lay"))
subject<- rbind(subject_train, subject_test)
total_descriptive <- cbind(activity, subject, selected)

#Step 4: Labels the data set with descriptive variable names.
#        Eliminated brackets "()" in the original column name from "features.txt";
#        Set column names to the activity and subject column.
column_name <- features[e,][,2]
column_name <- gsub("()","", column_name, fixed = TRUE)
colnames(total_descriptive) <- c("activity", "subject", column_name)

#Step 5: creates a second, independent tidy data set called "summarise" with the average of each variable 
#        for each activity and each subject.
#Step 5.1: Grouped the dataset according to activity and subject. 
#Step 5.2: Calculated the mean to the grouped dataset, 
#          producing a mean for each subject in each activity.

total <- tbl_df(total_descriptive) 
total<- group_by(total,activity, subject)
summarise <- summarise_all(total, mean)


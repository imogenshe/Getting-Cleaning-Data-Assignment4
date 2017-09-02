# Getting-Cleaning-Data-Assignment4
Assignment 4 in the getting and cleaning data subject, Data Science specialization by Coursera
Below describes the steps taken in getting the final clean data "summarise.txt". 

## Step 1 
Merge the x_train and x_test data together, forming a 100% data.

``new<- rbind(x_train, x_test, stringsAsFactors = FALSE)``

## Step 2
Extracts only the measurements on the mean and standard deviation for each measurement.
In the function "grep", "fixed =TRUE" makes sure only exact matchings are made.

`c <- grep("mean()", features$V2, fixed = TRUE)`

`d <- grep("std", features$V2, fixed= TRUE)`


## Step 3
Uses descriptive activity names to name the activities in the data set using the "revalue" function in the "plyr" package(Rename from number factors to descriptive factors ).
Combine "acitivy" and "subject" data to the original extracted data.

`activity$V1 <- revalue(activity$V1,c("1"="walk","2"="walk up", "3"="walk down", "4"="sit", "5"= "stand", "6"="lay"))`

`total_descriptive <- cbind(activity, subject, selected)`

## Step 4
Labels the data set with descriptive variable names.
Eliminated brackets "()" in the original column name from "features.txt";
Set column names to the activity and subject column.

`
column_name <- gsub("()","", column_name, fixed = TRUE)`

`colnames(total_descriptive) <- c("activity", "subject", column_name)`

## Step 5: 
creates a second, independent tidy data set called "summarise" with the average of each variable for each activity and each subject.
Grouped the dataset according to activity and subject. 
Calculated the mean to the grouped dataset, producing a mean for each subject in each activity.

`total<- group_by(total,activity, subject)`

`summarise <- summarise_all(total, mean)`

`write.table(summarise, "/Users/Imo/Desktop/UCI HAR Dataset/summarise.txt", row.names = FALSE)`

## Now we get a clean data!! :kissing_heart:
## Thank you for reading, my friend! :sparkling_heart: :innocent:

# Coursera Getting and Cleaning Data course project
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site
where the data was obtained:

This repository contains the following files:

- README.md - overview of the data set and how it was created.

- tidy_data.txt - contains the data set.

- CodeBook.md - code book, which describes the contents of the data set 

- run_analysis.R - the R script that was used to create the data set 

The R script run_analysis.R can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps 


- Read data.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the tidy_data.txt file.

This script requires the dplyr package

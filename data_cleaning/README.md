data_cleaning
=============

Course project for Coursera class "Getting and Cleaning Data"

run_analysis.R
This code is well-documented; here is a summary:

1. Read 'UCI_HAR_Dataset/features.txt' file into a data frame features.

2. Read 'UCI_HAR_Dataset/activity_labels' into a data frame activityLabels.

3. Search features dataframe for instances of "-mean()" and "-std()" to create logical vector indicating TRUE for indices of columns representing means and standard deviations for each measurement. Note that this excludes instances of "meanFreq()" and any other similar strings.

4. Create vector of all column names, converting given names to lower case and removing '.', '-', '(' and ')'. Also, check for duplicated 'bodybody', and replace with 'body'.

5. Read 'UCI_HAR_Dataset/test/x_test.txt', the measurement data for group test, into a data frame test.

6. Subset this same dataframe into the required columns using the logical vector created in Step 4.

7. Read 'UCI_HAR_Dataset/test/subject_test.txt' into a data frame.

8. Read 'UCI_HAR_Dataset/test/y_test.txt', the activity ids, into a data frame.

9. Bind activity column to test data frame.

10. Bind subject column to test data frame.

11. Repeat Steps 5-10 for group train, with files 'UCI_HAR_Dataset/train/x_train.txt', etc.

12. Bind train rows to test rows, combining into one data frame allData.

13. Merge activityLabels with allData to create an activity factor with descriptive activity names, and remove unneeded activity id column.

14. Aggregate allData by subject and activity, taking the mean of all measurement columns selected, creating data frame summary.

15. Write summary data frame to space-delimited file 'UCI_HAR_summary.txt'.

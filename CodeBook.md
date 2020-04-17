## Script description
With data preloaded into the project directory, run_analysis.R reads each of the following files from the original data set into the R environment:

1. X_train.txt
2. Y_train.txt
3. subject_train.txt
4. X_test.txt
5. Y-test.txt
6. subject_test.txt
7. features.txt
8. activity_labels.txt

Next, the script conducts an inner join on the Y_train and Y_test imports with activity_labels to get the activity names for each observation. Only the activity names are passed on to the master data set downstream.

The script then merges the X, Y, subject, and a new [test/train] variable for each data set (test & train). Then the test & train data are combined into one master data set. Using grep(), a vector is created to isolate variable names containing [Ss]td or [Mm]ean and then passed to the master data set, retaining only those variables.

Last, the subject, activity, and category variables are mutated into factor variables. The data set is grouped by subject and activity and each item is summarized by the mean of each variable in a new data set called master_sum. Both master and master_sum are then written to .csv format.

## Variables created

subject: factor variable; ID number provided by UCI corresponding to the subject under observation
activity: factor variable; one of six activities described in the original data set: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, or WALKING_UPSTAIRS
category: factor variable; identifies observation as belonging to test or train data. Values: test, train

The other 86 variables are the mean and standard deviation variables from the original data set. Please see features_info.txt for a description of each.

## Summary analysis file
The master_sum.csv file contains a mean value for each variable, grouped by subject and activity.
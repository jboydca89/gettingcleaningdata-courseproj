# gettingcleaningdata-courseproj
Repo to store files related to the Course Project for JHU's Getting and Cleaning Data course offered on Coursera.org.
Author: Jackson Boyd

## Abstract
This repository contains the original Human Activity Recognition Using Smartphones Data Set from UCI's Machine Learning Repository as well as an R script file that turns this data set into a tidy data set upon running.

Specifically, run_analysis.R does the following:
1. Merges all original data set files into one master file
2. Substitutes activity codes for actual names in order to have more descriptive values
3. Extracts only the measurements on the mean and standard deviation for each measurement
4. Creates descriptive variable names for each variable
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

CodeBook.md: Please see this file for an update to the original data set's codebooks
master.csv: Master tidy data set produced by the run_analysis.R script
master_sum.csv: Summary of each variable's mean, grouped by activity and subject. Also produced by run_analysis.R.
getdata_projectfiles_UCI HAR Dataset.zip: original .zip file from UCI to obtain data
gettingcleaningdata-courseproj.Rproj: R Project file to organize RStudio workspace
run_analysis.R: R script that runs every function described in the abstract
UCI-HAR-Dataset: unzipped data set directory from UCI. Please see its README file for detailed info.


## Original data set

The original data set can be obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A description of the original data set is located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
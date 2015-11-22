# Getting_and_Cleaning_Assignment
The course assignment for Getting and Cleaning Data, through Coursera

The code in run_analysis.R lceans and tidies a data set that is found in the files UCI HAR dataset.

The steps are commented in the R file, but briefly, the data for test subjects and train subjects is loaded in, then joined together into one dataset. This is then manipulated to be grouped by subjects and avtivities, and the means of the measurements is taken.

Only the measurements that have either "mean" or "std" in their title are taken for this dataset.

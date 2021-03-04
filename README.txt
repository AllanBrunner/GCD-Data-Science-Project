==================================================================
Tidy Data Dataset
Version 1.0
==================================================================
Allan D. Brunner
allan_brunner@icloud.com
==================================================================

The data set in this repository (tidydata.csv) contains the means of 68 variables
that were obtained from the Human Activity Recognition Using Smartphones Dataset.

This README file provides more information about the original data and 
explains how tidydata.csv was constructed.  For more details, refer to the other files in this repository:
run_analysis.R: R script that created tidy_data.csv
codebook.pdf: Descriptions of all variables in tidy_data.csv 

The data used for this project are here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The original source of the data is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The following data files were used:

X_test.txt: 561 measurements on 9 test subjects doing 6 activities (subjects performed the activity multiple times) 
y_test.txt: each row of this file identifies the activity performed in each row of X_test.txt 
sub_test.txt: each row of this file contains the subject identifier for each row of X_test.txt

X_train.txt: 561 measurements on 21 training subjects doing 6 activities (subjects performed the activity multiple times)
y_train.txt: each row of this file identifies the activity performed in each row of X_train.txt 
sub_train.txt: each row of this file contains the subject identifier for each row of X_train.txt

features.txt: labels for 561 features (measurements)
activity_labels.txt: labels for 


The data set was constructed as follows:

1. The file "features.txt" was read in, and variable name was relabeled as "feature".
2. The file "activity_labels.txt" was read in, and variable name was relabeled as "activity".

3. The file "subject_test.txt" was read in, and variable name was relabeled as "ID".
4. The file "y_test.txt" was read in, and variable name was relabeled as "activity".
5. The file "X_test.txt" was read in.

6. The file "subject_train.txt" was read in, and variable name was relabeled as "ID".
7. The file "y_train.txt" was read in, and variable name was relabeled as "activity".
8. The file "X_train.txt" was read in.

9. A logical vector was created (=TRUE if feature contained "mean" or "std").
10. Rows of features vector and columns of measurements were kept, if TRUE.

11. Measurements for test subjects was merged with subject and activity identifiers.
12. Measurements for training subjects was merged with subject and activity identifiers.
13. Test and training data were merged.

14. New data was constructed consisting of means for subject and activity.

 
   

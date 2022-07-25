README

**Introduction**

The script "run_analysis.R" provides summarized data set for a subset of the variables included in the original data "Human Activity Recognition Using Smartphones Data Set". The data set can be downloaded from here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

More information about the data can be obtained here:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

A codebook (Codebook.md) describing the output data set is available in the same repository as this README file.

**How to use the script**

1.  Download and extract the original data set (link above) and place in a suitable folder.
2.  Open the file "run_analysis.R" and change the path to the folder where you extracted the data set ("Step 1." in the file ") and the folder to output data set ("Step 11").
3.  Run the script.

**How the script works**

The script file performs the following steps:

Step 1. Setting work directory and loading dplyr library

Step 2. Reading data from the extracted "UCI HAR Dataset" folder:  
  
test/X_test.txt  
test/Y_test.txt  
train/X_train.txt  
train/Y_train.txt  
train/subject_train.txt  
test/subject_test.txt  
/activity_labels.txt  
/features.txt

Step 3a. Changing column names in the datasets for activities & subjects

Step 3b. Changing column names in the datasets for Y (test/train), to avoid having duplicate columns named V1 in later steps

Step 4. Merging test & training datasets into one dataset

Step 5. Filtering out relevant rows from the features datasets (we are interested in "mean()" and "std()" measurements)

Step 6.Translating step 5 output to column number in the full dataset

Step 7. Replacing unsuitable characters, namely "(" , ")" and "-" , in the measurment names (goal: improving tidyness)

Step 8. Select relevant columns from the full dataset that was merged in step 4 and providing suitable column names

Step 9. Group by subject.id and activity.id and adding activity labels (improving tidyness)

Step 10. Removing "help" columns from the group by operation

Step 11. Exporting the final data to chosen directory (final_df.txt)

**Thanks**
The script above was inspired by useful guidelines from David Hood and Luis A Sandino
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
https://drive.google.com/file/d/0B1r70tGT37UxYzhNQWdXS19CN1U/view?usp=sharing

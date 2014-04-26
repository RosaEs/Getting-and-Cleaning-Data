This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

Data source
===========
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


The R script run_analysis.R does the following: 
================================================
Read the datasets:
Measurements are in X_train.txt and X_test.txt
Subject ID are in subject_train.txt and subject_test.txt
Activity ID are in Y_train.txt and Y_test.txt
Activity ID and their correspondent labels are in the file activity_labels.txt.
Names and index of measurements are in file features.txt

Merge the training sets and the test sets.

Take a subset, extracts only the measurements on the mean and standard deviation for each measurement. 
Columns representing means contain "mean()" and columns representing standard deviations contain "std()".

Add additional columns to represent activity IDs from Y files and subject IDs from subject files.
Add additional column with descriptive activity names from activity_labels.txt.

Save the first data set with the name "first_tidy_data_set.txt"


Create a second tidy data set with average of each variable for each activity and each subject:

Melt the dataset using as ID "Activity_ID", "Activity_Name", "Subject_ID"
Cast the dataset with Activity_Name and Subject_ID as IDs and mean as the function.
Save the second data set with the name "second_tidy_data_set.txt"


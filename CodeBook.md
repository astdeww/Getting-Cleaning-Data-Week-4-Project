---
Title: 'Getting and Cleaning Data - Week 4 Project'
Author: "Astuti Dewi Wararwati"
Date: "29 May 2019"
---

# Getting-Cleaning-Data-Week-4-Project

This code book describes the variables, the data, and any transformations or work that has been performed to clean up the data.

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## The Procedure
#### 1. Merging the training and the test sets to create one data set.
The following text files were imported by using read.table:
- 'features.txt'
- 'activity_labels.txt'
- 'subject_train.txt'
- 'x_train.txt'
- 'y_train.txt'
- 'subject_test.txt'
- 'x_test.txt'
- 'y_test.txt'
Files were imported one by one and then file X, y, and subject merged into one.

#### 2. Extracting only the measurements on the mean and standard deviation for each measurement.
Based on features (in features.txt), the data on second column which had mean and standard deviation (std) was saved into new variable. This variable is used to select the features with attribute mean and standard deviation.

#### 3. Using descriptive activity names to name the activities in the data set
The activity names was assigned into y variable.

#### 4. Appropriately labels the data set with descriptive variable names.
The features which had retrieved on step 2 was used to labelling this step on X variables.

#### 5. Creating tidy data set with the average of each variable for each activity and each subject.
This step used chaining based on magrittr package. The idea was to group the data based on activity and the subject, and then calculate the average.
```
    the_data %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 
```
The data was saved by using write.table (in *.txt format). 

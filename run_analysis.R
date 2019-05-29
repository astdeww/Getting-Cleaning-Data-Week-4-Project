### Setting working directory
setwd('C:/.../Coursera/Getting & Cleaning Data/Week 4/UCI HAR Dataset')

## Reading data
#the training data
X_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')
sub_train <- read.table ('train/subject_train.txt')

#the testing data
X_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
sub_test <- read.table ('test/subject_test.txt')

# reading the features 
feat <- read.table ('features.txt')

# reading the activity labels
act_lab <- read.table ('activity_labels.txt')

### 1. Merges the training and the test sets to create one data set.
X <- rbind (X_train, X_test)
y <- rbind (y_train, y_test)
subject <- rbind(sub_train, sub_test)

# merging all data set 
merged.dt <- cbind(X,y, subject)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
feat.selected <- feat[grep("mean|std",feat[,2]),]

X <- X[,feat.selected[,1]]

### 3. Uses descriptive activity names to name the activities in the data set
# rename the V1 (default column names) into label
colnames(y) <- 'label'
# putting the labels based on the activities in the data set 
y$activity <- factor(y$label, labels = as.character(act_lab[,2]))

### 4. Appropriately labels the data set with descriptive variable names.
colnames(X) <- feat[feat.selected[,1],2]

### 5. From the data set in step 4, creates a second, independent tidy data set 
### with the average of each variable for each activity and each subject.
colnames(subject) <- "subject"

# merging the X, activity, and subject data set 
combined.dt <- cbind(X, y, subject)

# creating the average of each variable for each activity and each subject
library(magrittr)
final <- combined.dt %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# write final tidy data
write.table(final, file = 'tidy_data.txt', row.names = FALSE, col.names = TRUE)

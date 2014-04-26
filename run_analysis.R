#Getting and Cleaning Data.
#create one R script called run_analysis.R that does the following. 

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


#Put as working directory The ...\UCI HAR Dataset 
#setwd("C:/Users/Rosa/Data Science Specialization/Getting and Cleaning Data/w3/peerAssess/UCI HAR Dataset")

#### Read data and merge test data and train data ####

# read labels
train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
Y <- rbind(train, test)
colnames(Y) <- c("Activity_ID")

# read activity_labels
activity_labels <- read.table("activity_labels.txt", header=FALSE, as.is=TRUE, 
                              col.names=c("Activity_ID", "Activity_Name"))

# read subjects
train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
S <- rbind(train, test)
colnames(S) <- c("Subject_ID")

# read measures
train <- read.table("train/X_train.txt", )
test <- read.table("test/X_test.txt")
X <- rbind(train, test)

#### Use descriptive activity ####
# read column names
Features_cols <- read.table("features.txt", header=FALSE, as.is=TRUE, 
                            col.names=c("Measure_ID", "Measure_Name"))
colnames(X) <- Features_cols$Measure_Name

#### Extract only measurements on the mean and the std ####
Mean_Std_index <- grep(".*mean\\(\\)|.*std\\(\\)", Features_cols$Measure_Name)
data <- X[,Mean_Std_index]

# append all the columns 
data$Activity_ID <- Y$Activity_ID
data$Subject_ID <- S$Subject_ID

#### Appropriately labels the data with descriptive activity names ####
activity_labels$Activity_Name <- as.factor(activity_labels$Activity_Name)
data <- merge(data, activity_labels)

# Save the first data set
write.table(data, "first_tidy_data_set.txt")


#### Create a second tidy data set with average of each variable for each activity and each subject. ####

library(reshape2)

# melt the dataset
id = c("Activity_ID", "Activity_Name", "Subject_ID")
measure_vars = setdiff(colnames(data), id)
m_data <- melt(data, id=id, measure.vars=measure_vars)

# casting the dataset
second_data_set<-dcast(m_data, Activity_Name + Subject_ID ~ variable, mean)

# Save the second data set with the average of variables for each activity and each subject
write.table(second_data_set, "second_tidy_data_set.txt")

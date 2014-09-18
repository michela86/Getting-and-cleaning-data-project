Getting-and-cleaning-data-project
=================================
The analysis has been conducted using R. 
The UCI HAR dataset folder was located in the working directory. 

Step 1: create a complete dataset.
Open the data.frame package. 
From the UCI HAR dataset, read the following files (located in the train folder within the UCI HAR dataset one) and store them in the following elements:
- x_train.txt -> stored as "xtrain";
- y_train.txt ->stored  as "ytrain". Name the first column "activity";
- subject_train.txt -> stored as "trainsubj". Rename the first column "subject".
Merge the three elements in "traincompl" using cbind, to create a complete dataset for the train experiment.

Repeat the same steps for the test files (From the UCI HAR dataset, read the following files (located in the test folder within the UCI HAR dataset one) and store them in the following elements:
- x_test.txt -> stored as "xtest";
- y_test.txt ->stored  as "ytest". Name the first column "activity";
- subject_test.txt -> stored as "testsubj". Rename the first column "subject".
Merge the three elements in "testcompl" using cbind, to create a complete dataset for the train experiment) .

Merge traincompl and testcompl into a complete dataset , named as "compl", using rbind.

Using the dplyr library, order the dataset according to the value of activity (from 1 to 5) and the subjects (from 1 to 30). We have a new dataframe called "compl3"

Step 2: Extract measurements of the mean and standard deviation.
Using as reference the features.txt file located in the UCI HAR dataset folder, and stored in R as "label", subset the "compl3" dataframe using the command select. Select subject and activity along with all the variables referring to measurement of the mean and the standard deviation. Store the resulting dataframe as "mydata". 

Step 3: name the activities in the dataset. 
The goal of this step is to replace the numbers presented in the column "activity" of mydata with descriptive activities names, listed in the activity_labels.txt file (in the UCI HAR dataset folder). Each number has been replaced with the activity it described. 

Step 4: descriptive variable names. 



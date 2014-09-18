Raw data come from the UCI HAR Dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
Train and test data have been put together to form the complete dataset. 
The first variable, "Subject", refers to each person participating at the experiment. It ranges from 1 to 30. 
The second variable is "Activity". It has been transformed from a numerical variable (from 1 to 5) to a factor variable. It describes each activity(walking, walking upstairs, walking downstairs, sitting, standing, laying) performed by the subjects during the experiment. 
All the other variables refer to the time and frequency domain. From the 561 variables presented in the complete dataset, we extracted only variables referring to the mean and standard deviation of each measurement. At the end of the process, 66 varaibles have been chosen. Afterwards, we computed the average of each variable by activity and subject and we reported the results. 

AT the end of the process, our tidy dataset consists of 68 variables and 181 rows. 

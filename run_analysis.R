#Question 1: create a complete dataframe


library(data.table)
#TRAIN:
xtrain<- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
colnames(ytrain)[1] <- "activity"
trainsubj<- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubj)[1] <- "subject"
traincompl<-cbind(trainsubj,ytrain,xtrain)
#TEST:
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
colnames(ytest)[1] <- "activity"
testsubj<- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(testsubj)[1] <- "subject"
testcompl<-cbind(testsubj,ytest,xtest)
#MERGING:
compl<-rbind(testcompl,traincompl)
library(dplyr)
compl2<-arrange(compl,activity)
compl3<-arrange(compl2,id)


#Question 2: extract measurement of mean and sd
label<-read.table("./UCI HAR Dataset/features.txt")

mydata<-select(compl3, subject:V6,V41:V46,V81:V86,V121:V126,V161:V166,V201,V202,V214,V215,V227,V228,V240,V241,253,254,266:V271,345:350,424:429,503,504,529,530,542,543)

#Question 3:name the activities in the dataset

mydata$activity <- as.character(mydata$activity)
mydata$activity[mydata$activity == "1"] <- "walking"
mydata$activity[mydata$activity == "2"] <- "walking upstairs"
mydata$activity[mydata$activity == "3"] <- "walking downstairs"
mydata$activity[mydata$activity == "4"] <- "sitting"
mydata$activity[mydata$activity == "5"] <- "standing"
mydata$activity[mydata$activity == "6"] <- "laying"
     
     
#Question 4: descriptive variables names. 

colnames(mydata)[3] <- "Mean time body accelaration on the x axis"
colnames(mydata)[4] <- "Mean time body accelaration on the y axis"
colnames(mydata)[5] <- "Mean time body accelaration on the z axis"
colnames(mydata)[6] <- "Standard deviation time body accelaration on the x axis"
colnames(mydata)[7] <- "Standard deviation time body accelaration on the y axis"
colnames(mydata)[8] <- "Standard deviation time body accelaration on the z axis"
colnames(mydata)[9] <- "Mean time gravity acceleration on the x axis"
colnames(mydata)[10] <- "Mean time gravity acceleration on the y axis"
colnames(mydata)[11] <- "Mean time gravity acceleration on the z axis"
colnames(mydata)[12] <- "Standard deviation time gravity acceleration on the x axis"
colnames(mydata)[13] <- "Standard deviation time gravity acceleration on the y axis"
colnames(mydata)[14] <- "Standard deviation time gravity acceleration on the z axis"
colnames(mydata)[15] <- "Mean time body accelaration jerk on the x axis"
colnames(mydata)[16] <- "Mean time body accelaration jerk on the y axis"
colnames(mydata)[17] <- "Mean time body accelaration jerk on the z axis"
colnames(mydata)[18] <- "Standard deviation time body accelaration jerk on the x axis"
colnames(mydata)[19] <- "Standard deviation time body accelaration jerk on the y axis"
colnames(mydata)[20] <- "Standard deviation time body accelaration jerk on the z axis"
colnames(mydata)[21] <- "Mean time body gyro on the x axis"
colnames(mydata)[22] <-"Mean time body gyro on the y axis"
colnames(mydata)[23] <-"Mean time body gyro on the z axis"
colnames(mydata)[24] <- "Standard deviation time body gyro on the x axis"
colnames(mydata)[25] <-"Standard deviation time body gyro on the y axis"
colnames(mydata)[26] <- "Standard deviation time body gyro on the z axis"
colnames(mydata)[27] <- "Mean time body gyro jerk on the x axis"
colnames(mydata)[28] <- "Mean time body gyro jerk on the y axis"
colnames(mydata)[29] <- "Mean time body gyro jerk on the z axis"
colnames(mydata)[30] <- "Standard deviation time body gyro jerk on the x axis"
colnames(mydata)[31] <- "Standard deviation time body gyro jerk on the y axis"
colnames(mydata)[32] <- "Standard deviation time body gyro jerk on the z axis"
colnames(mydata)[33] <- "Mean time body acceleration mag"
colnames(mydata)[34] <- "Standard time body acceleration mag"
colnames(mydata)[35] <- "Mean time gravity acceleration mag"
colnames(mydata)[36] <- "Standard deviation time gravity acceleration mag"
colnames(mydata)[37] <-  "Mean time gravity acceleration jerk mag"
colnames(mydata)[38] <-  "Standard deviation time gravity acceleration jerk mag"
colnames(mydata)[39] <- "Mean time body gyro mag"
colnames(mydata)[40] <- "Standard deviation time body gyro mag"
colnames(mydata)[41] <- "Mean time body gyro jerk mag"
colnames(mydata)[42] <- "Standard deviation time body gyro jerk mag"
colnames(mydata)[43] <- "Mean frequency body acceleration on the x axis"
colnames(mydata)[44] <- "Mean frequency body acceleration on the y axis"
colnames(mydata)[45] <- "Mean frequency body acceleration on the z axis"
colnames(mydata)[46] <- "Standard deviation frequency body acceleration on the x axis"
colnames(mydata)[47] <- "Standard deviation frequency body acceleration on the y axis"
colnames(mydata)[48] <- "Standard deviation frequency body acceleration on the z axis"
colnames(mydata)[49] <- "Mean frequency body acceleration jerk on the x axis"
colnames(mydata)[50] <- "Mean frequency body acceleration jerk on the y axis"
colnames(mydata)[51] <- "Mean frequency body acceleration jerk on the z axis"
colnames(mydata)[52] <- "Standard deviation frequency body acceleration jerk on the x axis"
colnames(mydata)[53] <- "Standard deviation frequency body acceleration jerk on the y axis"
colnames(mydata)[54] <- "Standard deviation frequency body acceleration jerk on the z axis"
colnames(mydata)[55] <- "Mean frequency body gyro on the x axis"
colnames(mydata)[56] <- "Mean frequency body gyro on the y axis"
colnames(mydata)[57] <- "Mean frequency body gyro on the z axis"
colnames(mydata)[58] <- "Standard deviation frequency body gyro on the x axis"
colnames(mydata)[59] <-  "Standard deviation frequency body gyro on the y axis"
colnames(mydata)[60] <-  "Standard deviation frequency body gyro on the z axis"
colnames(mydata)[61] <-  "Mean frequency body acceleration mag"
colnames(mydata)[62] <-  "Standard deviation frequency body acceleration mag"
colnames(mydata)[63] <- "Mean frequency body acceleration gyro mag"
colnames(mydata)[64] <- "Standard deviation frequency body acceleration gyro mag"
colnames(mydata)[65] <-  "Mean frequency body acceleration gyro jerk mag"
colnames(mydata)[66] <- "Standard deviation frequency body acceleration gyro jerk mag"



#Question 5: average of each variable by subject and activities
average<-mydata %>% 
	group_by(subject,activity) %>% 
   summarise_each(funs(mean))
   
#Saving data   
 write.table(average,"./dataproj.txt",row.names=F)


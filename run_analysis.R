## Please change the folder
setwd("C:\\Users\\i038196\\Desktop\\vedio\\work\\UCI HAR Dataset")
## Load Data
trainx <- read.table("train\\X_train.txt", head=FALSE)
trainy <- read.table("train\\y_train.txt", head=FALSE)
trainsub <- read.table("train\\subject_train.txt", head=FALSE)
testx <- read.table("test\\X_test.txt", head=FALSE)
testy <- read.table("test\\y_test.txt", head=FALSE)
testsub <- read.table("test\\subject_test.txt", head=FALSE)
## Merge train and test data
bindx <- rbind(trainx, testx)
bindy <- rbind(trainy, testy)
bindsub <- rbind(trainsub, testsub)

##Item 2: Extracts only the measurements on the mean and standard deviation for each measurement
col_names <- read.table("features.txt", head = FALSE)
col_names <- col_names[,2]
names(bindx) <- col_names
col_names_index <-  grep("mean\\(\\)|std\\(\\)", col_names)
##Only select data dimension for mean and standard deviation
bindx <- subset(bindx, select = col_names_index)

##Item 3:Uses descriptive activity names to name the activities in the data set
names(bindy) <- c("activity")
names(bindsub) <- c("subject")
activity_label <- read.table("activity_labels.txt", head = FALSE)
names(activity_label) <- c("activity","act.desc")
activity_desc <- merge(bindy, activity_label,by.x="activity",by.y="activity", all = FALSE);
bindy <- activity_desc["act.desc"]

##Item 4:Appropriately labels the data set with descriptive activity names. 
col_names <- names(bindx)
col_names <- tolower(col_names)
col_names <- gsub("\\(\\)","",col_names)
col_names <- gsub("-",".",col_names)
col_names <- paste0(substr(col_names,1,1),".",substr(col_names,2,nchar(col_names)))
col_names <- gsub("body","body.",col_names)
col_names <- gsub("gravity","grav.",col_names)
col_names <- gsub("jerk",".jerk",col_names)
col_names <- gsub("mag",".mag",col_names)
names(bindx) <- col_names

##Item 1:avMerges the training and the test sets to create one data set.
binddata <- cbind(bindx, bindy, bindsub)

##Item 5:Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##split group
split.group <- split(binddata, list(binddata$subject, binddata$act.desc), drop = TRUE)
dimension <- dim(bindx)[2]
##get the average value
column.mean <- lapply(split.group, function(x) colMeans(x[,1:dimension]))
output_mean<-as.data.frame(column.mean)
##write to the txt file
write.table(output_mean, "exportdata.txt", sep="\t") 
write.csv(output_mean,"exportdata.csv")





##Data
I get the data from this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Transformation to the data
* Combine the train and test data
* Merge the 3 type of data, x, y, and subject into one data set
* Only pick up mean and std values from the data set
* Replace activity id with activity description in the data set
* Rename dimension name to make it readable
* Get mean value for each activity and subject group combination

##Main Variable description
* trainx: read data from x-train.txt
* trainy: read data from y-train.txt
* trainsub: read data from sub-train.txt
* testx: read data from x-test.txt
* testy: read data from y-test.txt
* testsub:read data from sub-test.txt
* bindx: data combine for trainx and testx
* bindy: data combine for trainy and testy
* bindsub: data combine for trainsub and testsub
* binddata: The combined data set
* col_names: descriptions for data frame bindx
* col_names_index: index for mean and std columns
* output_mean: output data set


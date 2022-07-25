###### Coursera course: "Getting & cleaning data" 
###### Title: Course project 
###### What it does: Provides a summarized, tidy dataset for mean and std variables. 
###### Input dataset: Human Activity Recognition Using Smartphones Data Set 
###### Link to input data: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Step 1. Setting work directory and loading dplyr library
setwd("/Volumes/Lagring/Annat/Programmering/R/Getting and cleaning data/")
library(dplyr)

# Step 2. Reading data from disk
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", sep = "")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", sep = "")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")
act.labels<-read.table("UCI HAR Dataset/activity_labels.txt",sep="")
features<-read.table("UCI HAR Dataset/features.txt",sep="",stringsAsFactors=T)

# Step 3a. Changing column names in the datasets for activities & subjects
colnames(act.labels)<-c("activity.id","activity.name")
colnames(subject_test)<-"subject"
colnames(subject_train)<-"subject"

# Step 3b. Changing column names in the datasets for y, to avoid having duplicate columns named V1 in later steps
colnames(y_train)<-"y"
colnames(y_test)<-"y"

# Step 4. Binding test & training datasets
test_merged<-cbind(subject_test,y_test,X_test)
train_merged<-cbind(subject_train,y_train,X_train)
full.data<-rbind(train_merged,test_merged)

# Step 5. Filtering out relevant rows from the features datasets (we are interested in "mean()" and "std()" columns)
relevant.col.num = as.double(which(grepl("(?:std\\(\\)|mean\\(\\))", features$V2,perl = TRUE)))
relevant.col.names<-features[relevant.col.num,]

# Step 6.Translating step 5 output to column number in the full dataset
relevant.col.num<-relevant.col.num[order(as.numeric(relevant.col.num))]+2

# Step 7. Replacing unsuitable characters in the feature names (goal: improving tidyness)

relevant.col.names$V2<-gsub("-",".",relevant.col.names$V2,fixed=TRUE) #,fixed=TRUE
relevant.col.names$V2<-gsub("()","",relevant.col.names$V2,fixed=TRUE)
relevant.col.names$V2<-gsub("^t","time.",relevant.col.names$V2)
relevant.col.names$V2<-gsub("^f","freq.",relevant.col.names$V2)

# Step 8. Select relevant columns from the full dataset that was merged in step 4 and providing suitable column names
relevant.data<-select(full.data,c(1:2,relevant.col.num))
colnames(relevant.data)<-c("subject.id","activity.id",relevant.col.names$V2)

# Step 9. Group by subject.id and activity.id, adding activity labels (improving tidyness)
semifinal.df <- aggregate(relevant.data, by=list(relevant.data$subject.id, relevant.data$activity.id), FUN = "mean")
final.df<-inner_join(act.labels,semifinal.df, by="activity.id")

# Step 10. Removing help columns from the group by operation
final.df<-select(final.df, -Group.1,-Group.2)

# Step 11. Write final.df to disk
write.table(final.df, "/Volumes/Lagring/Annat/Programmering/R/Getting and cleaning data/final_df.txt", sep=";", quote=FALSE, row.names=FALSE, col.names=TRUE)

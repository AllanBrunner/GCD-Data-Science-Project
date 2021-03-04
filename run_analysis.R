########1#########2#########3#########4#########5#########6#########7###########
#                                                                              #
#  run_analysis (03/03/2021)                                                   #
#                                                                              #
#  This program constructs a tidy data set summarizing human activity          #
#  obtained from cellphones for Getting and Cleaning Data course.              #
#                                                                              #
#########1#########2#########3#########4#########5#########6#########7##########

   library(dplyr)
 
#  read in features lables (n=561) and keep only 2nd column
#  rename column "feature"

   features <- read.table("Data/features.txt", header=FALSE) 

   features <- subset(features, select = 2)
   names(features) <- "feature"
   
   head(features)
   

#  read in activities lables (n=6) and keep only 2nd column   
#  rename column "activity"
   
   activities <- read.table("Data/activity_labels.txt", header=FALSE) 

   activities <- subset(activities, select = 2)
   names(activities) <- "activity"
   
   head(activities)
   
   
#  read in test data and rename columns for subject ID and activities
 
   subj_test <- read.table("Data/test/subject_test.txt", header=FALSE) 
   actv_test <- read.table("Data/test/y_test.txt", header=FALSE) 
   meas_test <- read.table("Data/test/X_test.txt", header=FALSE) 
   
   names(subj_test) <- "ID"
   names(actv_test) <- "activity"
   
   head(subj_test)   
   table(subj_test)
   
   head(meas_test)

   head(actv_test)
   table(actv_test)

      
#  read in train data and rename columns for subject ID and activities
   
   subj_train <- read.table("Data/train/subject_train.txt", header=FALSE) 
   actv_train <- read.table("Data/train/y_train.txt", header=FALSE) 
   meas_train <- read.table("Data/train/X_train.txt", header=FALSE) 
   
   names(subj_train) <- "ID"
   names(actv_train) <- "activity"
   
   head(subj_train)   
   table(subj_train)
   
   head(meas_train)
   
   head(actv_train)
   table(actv_train)
   
   
#  extract features that are either means or standard deviations     
   
   keep1 <- grepl("mean()", features[,2], fixed = TRUE)
   keep2 <- grepl("std()", features[,2], fixed = TRUE)
   keep <- as.logical(keep1 + keep2)
   
   summary(keep)
   
   features_keep   <- subset(features, subset=keep)
   meas_test_keep  <- subset(meas_test, select=keep)
   meas_train_keep <- subset(meas_train, select=keep)
   

#  column-bind measurements, subjects, and activities
#  row-bind test and train data   
   
   dat_test  <- cbind(subj_test, actv_test, meas_test_keep)
   dat_train <- cbind(subj_train, actv_train, meas_train_keep)
   
   dat <- rbind(dat_test, dat_train)

   len <- ncol(dat)
   
   dat <- arrange(dat, ID, activity)
   
   head(dat, n=10)
   tail(dat, n=10)
   
   
#  create a new dataset consisting of means for all features by ID and activity   
   
   mdat <- as.data.frame(matrix(nrow=180,ncol=len))
   
   names(mdat) <- names(dat)
      
   for(i in 1:30) {
       for(j in 1:6) {
         
           x <- subset(dat, ID==i & activity==j)
           y <- apply(x, 2, mean)
          
           mrow <- 6*(i-1) + j
           
           mdat[mrow, ] <- y       
      
       }
   } 


#  write features as a test file   
#  write activities as a text file
#  write data file as a CSV file.
   
   
   write.table(features_keep,"features.txt", col.names = FALSE, row.names = FALSE)    
   write.table(activities,"activities.txt", col.names = FALSE, row.names = FALSE)    
   write.csv(mdat, "tidy_data.csv")   

   
   
   
   
   
## run_analysis.R

## run_analysis:
##
## Reads variable names and activity labels. Determines which data columns to 
## return, and formats column names to make them easier to work with.
## Calls get_data for "test" and "train", and merges resulting data frames.
## Merges activity labels with ids to create activity factor.
## Summarizes data with average of each variable by subject and activity, and 
## saves resulting summary.
run_analysis <- function() {
        ## Read file containing variable names
        features <- read.table("data/UCI_HAR_Dataset/features.txt")
        
        ## Read file containing activity labels
        activityLabels <- read.table("data/UCI_HAR_Dataset/activity_labels.txt",
                                     col.names = c("id", "activity"))
        
        ## Create logical vector containing indices of the mean and standard 
        ## deviation for each measurement:
        ## Include only "-mean()" and "-std()"
        ## Exclude "meanFreq()", etc
        meanStd <- grepl("-(mean|std)\\(\\)", features[, 2])
        
        ## Create vector of 'pretty' names for variables in features:
        ## remove '.', '-', '(' and ')' and convert to lower case
        featuresPretty <- tolower(gsub("\\.|-|\\(|\\)", "", features[, 2]))
        
        ## Some of the feature names have an extraneous 'body' in them
        featuresPretty <- gsub("bodybody", "body", featuresPretty)
        
        ## Get test data
        test <- get_data(meanStd, featuresPretty, "test")
        
        ## Get train data
        train <- get_data(meanStd, featuresPretty, "train")
        
        ## Combine test and train data into one dataframe
        allData <- rbind(test, train)
        
        ## Merge activity labels to create activity factor
        allData <- merge(activityLabels,
                         allData,
                         by.x = "id",
                         by.y = "activityid",
                         all.y = TRUE)
        
        ## Remove activity ID column
        allData$id <- NULL
        
        ## Summarize data with the average of each variable for each activity 
        ## and each subject
        summary <- aggregate(allData[, seq(3, ncol(allData), 1)],
                             by = list(allData$subject, allData$activity),
                             FUN = mean)
        
        ## Set group column names
        colnames(summary)[1] <- "subject"
        colnames(summary)[2] <- "activity"
        
        ## Order data by subject, activity
        summary <- summary[order(summary$subject, summary$activity), ]
        
        ## Write summary to output file
        write.table(summary,
                    "data/UCI_HAR_summary.txt",
                    row.name = FALSE)
}

## get_data:
## Argument myCols     - Logical vector indicating which columns to return
## Argument myColNames - Character vector with names of all columns
## Argument testTrain  - "test" or "train"
##
## Reads test or train dataset, then binds subject and activity columns to it. 
## Returns dataframe with subject, activity id, and requested data columns.
get_data <- function(myCols, myColNames, testTrain) {
        ## Set filenames
        basePath <- "data/UCI_HAR_Dataset/"
        
        datFile <- paste(basePath, testTrain, "/X_", testTrain, ".txt",
                         sep = "")
        
        subFile <- paste(basePath, testTrain, "/subject_", testTrain, ".txt",
                         sep = "")
        
        actFile <- paste(basePath, testTrain, "/y_", testTrain, ".txt",
                         sep = "")
        
        ## Read file containing dataset
        data <- read.table(datFile,
                           col.names = myColNames,
                           skipNul = TRUE)
        
        ## Filter for just the columns in myCols
        data <- data[, myCols]
        
        ## Read file containing subjects by row
        subject <- read.table(subFile,
                              col.names = "subject")
        
        ## Read file containing activities by row
        activity <- read.table(actFile,
                               col.names = "activityid")
        
        ## Bind activity column to dataframe
        data <- cbind(activity, data)
        
        ## Bind subject column to dataframe
        data <- cbind(subject, data)
        
        ## Return data
        get_data <- data
        
        get_data
}
run_analysis <- function(dirName) { ## directory name is "UCI HAR Dataset"
    ## File name initialization
    fileXtestName <- paste(dirName, "\\test\\X_test.txt", sep = "") 
    fileYtestName <- paste(dirName, "\\test\\Y_test.txt", sep = "")
    fileXtrainName <- paste(dirName, "\\train\\X_train.txt", sep = "")
    fileYtrainName <- paste(dirName, "\\train\\Y_train.txt", sep = "")
    fileFeaturesName <- paste(dirName, "\\features.txt", sep = "")
    fileActlabelsName <- paste(dirName, "\\activity_labels.txt", sep = "")

    ## Reading files
    x_test <- read.table(fileXtestName) ## read file X_test.txt
    y_test <- read.table(fileYtestName) ## read file y_test.txt
    x_train <- read.table(fileXtrainName) ## read file x_train.txt
    y_train <- read.table(fileYtrainName) ## read file y_train.txt
    features <- read.table(fileFeaturesName) ## read file features.txt
    actLabels <- read.table(fileActlabelsName)
    
    ## Merging
    x <- merge(x_test, x_train, all.x = T, all.y = T)
    names(x) <- features[,2]
    y <- merge(y_test, y_train, all.x = T, all.y = T)
    
    ## Extracting features
    allMeans <- x[, grep("mean", names(x), value = T)] ## extracting means
    allStds <- x[, grep("std", names(x), value = T)] ## extracting stds
    extrX <- cbind(allMeans, allStds) ## combine means and stds
    
    ## Writing data
    write.table(extrX, file = "cleandata.txt", row.name = FALSE)
    
}
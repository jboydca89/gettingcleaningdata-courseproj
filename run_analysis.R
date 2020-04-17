# load packages
library(tidyverse)

# read data in to R environment using read_delim from readr package
train <- read_delim("./UCI-HAR-Dataset/train/X_train.txt", " ", col_names = F)
trainlab <- read_delim("./UCI-HAR-Dataset/train/Y_train.txt", "\n", col_names = F)
trainsub <- read_delim("./UCI-HAR-Dataset/train/subject_train.txt", "\n", col_names = F)

test <- read_delim("./UCI-HAR-Dataset/test/X_test.txt", " ", col_names = F)
testlab <- read_delim("./UCI-HAR-Dataset/test/Y_test.txt", "\n", col_names = F)
testsub <- read_delim("./UCI-HAR-Dataset/test/subject_test.txt", "\n", col_names = F)

features <- read_delim("./UCI-HAR-Dataset/features.txt", " ", col_names = F)$X2
activities <- read_delim("./UCI-HAR-Dataset/activity_labels.txt", delim = " ", col_names = F)

# apply variable names
# join activity number with name/remove number
# mutate numeric data to numeric format
# add variable to indicate test or train
trainlab <- trainlab %>% inner_join(activities) %>% select(X2) %>% rename(activity = X2)
trainsub <- trainsub %>% rename(subject = X1)
train <- train %>% mutate_all(as.numeric)
colnames(train) <- features
traincat <- tibble(category = rep("train",nrow(train)))

testlab <- testlab %>% inner_join(activities) %>% select(X2) %>% rename(activity = X2)
testsub <- testsub %>% rename(subject = X1)
test <- test %>% mutate_all(as.numeric)
colnames(test) <- features
testcat <- tibble(category = rep("test",nrow(test)))

# merge all 4 files for test & train into one dataset each
# remove obsolete files
trainmerge <- cbind(trainsub, trainlab, traincat, train)
rm(trainlab, trainsub, traincat)

testmerge <- cbind(testsub, testlab, testcat, test)
rm(testlab, testsub, testcat)

rm(features, activities)

# merge test & train data sets into one master set
# isolate variables that provide mean or standard deviation data
master <- rbind(testmerge, trainmerge)
rm(testmerge, trainmerge)

meanSDVec <- grep(("[Ss]td|[Mm]ean"), names(master))
master <- master[,c(1:3,meanSDVec)]
rm(meanSDVec)

# convert subject, activity, category to factor variables
master <- master %>% mutate(subject = as.factor(subject), activity = as.factor(activity), category = as.factor(category))

# create new data set grouped by subject and activity, showing mean for each variable
master_sum <- master %>% group_by(activity, subject) %>% summarise_if(is.numeric, mean, na.rm = T)

# write to CSV
write_csv(master, "master.csv")
write_csv(master_sum, "master_sum.csv")
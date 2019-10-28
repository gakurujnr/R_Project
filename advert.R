library(ISLR)
advert = advertising
head(advert)

install.packages("caret")
#During this week’s independent project, you will get to test the skills that you learned during this week’s sessions. Specifically, you will get the test your understanding of the following the learning outcomes of this week. 

#Learning Outcomes

#By the end of this week, you should be able to;

#Perform data cleaning and exploratory data analysis effectively in R. 
#Solve supervised learning problems in R by applying a variety of learning algorithms to data.
#Evaluate the performance of your machine learning models.
#Demonstrate communication skills that facilitate the effective presentation of data modeling to relevant stakeholders.
#Deliverables

#The deliverables for this week’s Independent project include: 
  
 # R Markdown Document hosted on Github
install.packages('cowplot')
install.packages('parallel')
install.packages('foreach')
install.packages('doParallel')
install.packages('e1071', dependencies=TRUE)

# Package
library(tidyverse)  # data manipulation and visualization
library(modelr)     # provides easy pipeline modeling functions
library(broom)      # helps to tidy up model outputs
library(ggplot2)    # Used for ggplot for comparing variables
library(cowplot)    # Used for ggplot visualization output
library(parallel)   # Used in KNN for preparing parallel precessing
library(doParallel)
library(foreach)
library(caret)


## Loading the data
advert <- read.csv('advertising.csv')
advert

## Display sample of the top data in dataset
head(advert)

## Display sample of the tail data in dataset
tail(advert)

## Checking the rows and the columns of the dataset
rownames(advert, do.NULL = TRUE, prefix = "row")
## rownames(advert) <- value

colnames(advert, do.NULL = TRUE, prefix = "col")
## colnames(advert) <- value

## display the structure of an R object
## displaying contents of lists
## To get an output of your data frame structure
str(advert)
## Tells us all the content in the dataset dtype and unique values in the dataset


## Checking the type of dataset
typeof(advert)

## checking on missing values in the dataset
is.na(advert)  # returns TRUE of advert is missing
## The dataset has no missing values

## Sum of missing values
sum(is.na(advert))
## No missing values

## Checking for duplicates
duplicated(advert)
## There is no duplicates in the datset

## Checking for the sum of duplicates in the dataset
sum(duplicated(advert))
## Sum of duplicates is 0

## CHecking on unique values across the column
unique(advert)
## We find out that every column have several unique values

## Column names
names(advert)

# Summarizing data
summary(advert)
## Summary of each and every column including Min, Max, Mean, Median, Quantiles

# Bivariate Analysis
#  Plot a boxplot to help  visualise any existing outliers 
boxplot(advert)
## Has outliers and won't drop them as at times outliers are of importance

## Histogram to show the distribution of age in the dataset
hist(advert$Age)
## Most of the people who took part in the advertisement Age lied between 30 - 35

## Histogram to show the distribution of gender in the dataset
hist(advert$Male)
## Male are indicated as 1 and female are 0 where female are slightly more than male

## Histogram to show the distribution of gender in the dataset
hist(advert$Area.Income)
## From the dataset most of the people earned 6000 - 6500

## Histogram to show the distribution of Daily.Time.Spent.on.Site in the dataset
hist(advert$Daily.Time.Spent.on.Site)
## From the dataset time that was mostly spent on site was 75 - 80

## Multivariate
## GGplot
plot1 <- ggplot(advert, aes(x = Age, y = Daily.Internet.Usage, color = Clicked.on.Ad)) + geom_point(size = 3) +
  theme(text = element_text(size = 10), axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5))
plot_grid(plot1)
##

## 
plot2 <- ggplot(advert, aes(x = Daily.Time.Spent.on.Site, y=Daily.Internet.Usage, color=Clicked.on.Ad)) + geom_point(size=3)+
  theme(text = element_text(size=10) ,axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5))
plot_grid(plot2)
##

##
plot3 <- ggplot(advert, aes(x = Age, y = Area.Income, color=Clicked.on.Ad)) + geom_point(size=3)+
  theme(text = element_text(size=10) ,axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5))
plot_grid(plot3)
## 

##
plot4 <- ggplot(advert, aes(x = Area.Income, y = Daily.Internet.Usage, color = Clicked.on.Ad)) + geom_point(size=3)+
  theme(text = element_text(size=10) ,axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5))
plot_grid(plot4)
## 

# SPLITTING TRAIN AND TEST SET
advert$Clicked.on.Ad = as.factor(advert$Clicked.on.Ad)
training1 <- createDataPartition(y = advert$Clicked.on.Ad, p = .75, list = FALSE)

# TRAIN SET
training <- advert[training1,]

# TEST SUBSET
testing  <- advert[-training1,]

# KNN
# Prepare Parallel Process
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)

#control parameters for cross-validation
controlknn <- trainControl(method = "repeatedcv", number = 10, repeats = 3, verboseIter = TRUE)
KNNall <- train(Clicked.on.Ad ~ .,data = training, method = "knn",trControl = controlknn,preProc = c("center", "scale"),tuneLength = 10)

## KNN model output
KNNall



# Import the random forest library and fit a model
install.packages('randomForest')
library(randomForest)
Advert = randomForest(Clicked.on.Ad ~ Daily.Time.Spent.on.Site + Age + Daily.Internet.Usage + Ad.Topic.Line + City + Country + Timestamp + Male + Area.Income, data = advert, importance = TRUE)                    
                                           
# Create an importance based on mean decreasing gini
importance(Advert)



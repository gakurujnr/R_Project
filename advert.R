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



# Package
library(tidyverse)  # data manipulation and visualization
library(modelr)     # provides easy pipeline modeling functions
library(broom)      # helps to tidy up model outputs
library(ggplot2)

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

# Summarizing data
summary(advert)
## Summary of each and every column including Min, Max, Mean, Median, Quantiles


# Import the random forest library and fit a model
install.packages('randomForest')
library(randomForest)
Advert = randomForest(Clicked.on.Ad ~ Daily.Time.Spent.on.Site + Age + Daily.Internet.Usage + Ad.Topic.Line + City + Country + Timestamp + Male + Area.Income, data = advert, importance = TRUE)                          
                                           
# Create an importance based on mean decreasing gini
importance(Advert)

#  Plot a boxplot to help  visualise any existing outliers 
# 
#  
boxplot(advert)

## List the outliers in vectors
boxplot.stats(advert)$out

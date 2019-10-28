# R_Project
Advertisement Recommendation Model In R
Research Questions
Create a prediction model that more accurately predicts whether a user will click an Ad or not.

Problem Statement
A Kenyan entrepreneur has created an online cryptography course and would want to advertise it on her blog. She currently targets audiences originating from various countries. In the past, she ran ads to advertise a related course on the same blog and collected data in the process which would be used for anlaysis.

Context
We have 1000 rows

We have the following columns:

'Daily.Time.Spent.on.Site'

'Age'

'Area.Income'

'Daily.Internet.Usage'

'Ad.Topic.Line'

'City'

'Male'

'Country'

'Timestamp'

'Clicked.on.Ad'

Steps Followed
1.Loading Data

  Using tidyverse library
2.Data Exploration/Cleaning

  Renamed the columns

  There were no missing values and duplicates

  The few outliers that were avilable i dint remove them so that we can identify the reasons as to why they exist
3.Model Training

  I used KNeighbours Classifier to fit the model
4.Model Prediction

  using the split data to make prediction

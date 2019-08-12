---
title: "CodeBook"
author: "Jack Crawford"
date: "8/11/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Here's what my run_analysis.R does:

##1. Imports the data
I manually downloaded the datasets and put them in the appropriate directory.

##2. Assigns the data to variables:
features is assigned to features.txt
activities is assigned to activity_labels.txt
subject_test is assigned to subject_test.txt
x_test is assigned to X_test.txt
y_testis assigned to y_test.txt
subject_train is assigned to subject_train.txt
x_train is assigned to X_train.txt
y_train is assigned to y_train.txt

##3. Merges the train and test datasets
Using rbind, I combined x_test and x_train into x, y_test and y_train into y, and subject_test and subject_train into subject.
Using cbind, I combined x, y, and subject into `merged`. 

##4. Creates tidied from merged
The tidied dataset, aptly named `tidied`, is subsetted from merged, selecting only subject, code, mean, and standard deviation. 

##5. Descriptive naming
I replaced the code column of `tidied` with the corresponding activity from the second column of activities, and appropriately labeled the dataset with good column names.

##6. Creates second tidy dataset
`finalData` is created from `tidied` by finding the means of each activity and subject, after grouping them accordingly. This is then exported into finalData.txt


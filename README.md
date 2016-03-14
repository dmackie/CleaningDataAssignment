Getting and Cleaning Data Assignment
====================================

This repository contains my submission for the final assignment for the Getting and Cleaning Data Course run by Johns Hopkins University on Coursera.

More info: https://www.coursera.org/learn/data-cleaning

## Contents

* `README.md` - this file
* `run_analysys.R` - submitted assignment script (See below)
* `average_by_subject_by_activity.txt` - generated output of `run_analysys.R`
* `CodeBook.md` - Names and descriptions describing the variables in `average_by_subject_by_activity.txt` and the methods used to generate it

## Assignment
> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

> Here are the data for the project:

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

== run_analysys.R

1. Before running the script:
    1. Download the `UCI HAR Dataset.zip` from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/ and unzip it into the root of the repo.
    2. If a directory other than `UCI HAR Dataset/` is chosen then `*_path` variables in the top of `run_analysys.R` will need to be modified

2. The `run_analysis.R` script when run does the following:

    1. Merge the `test` and `train` data sets found in the `UCI HAR Dataset/` direcotry
    2. Combine the `subject_id`, `activity_id` and measurements into a single data set
    3. Change the corresponding `activity_id` to an `activity` name
    4. Extract only the `-mean()` and `-std()` measurements
    5. Calculate the average of each of the above by `subject_id` and `activity`
    6. Generates a new tidy data set called `average_by_subject_by_activity.txt` in the root of the repo.

*(Further details can be found in the comments of `run_analysis.R`)*

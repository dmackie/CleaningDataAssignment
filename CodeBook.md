*This CodeBook is an edited version of the `features_info.file` provided by the original data set.*

CodeBook
=================

## Data set

The original data set comes from a study that captured the measurements of the embedded accelerometer and gyroscope of a smartphone.

**Abstract**
> "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors."

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set consists of two sets of data called `test` and `train` that both contain the following measurements.

## Measurements

The data set consists of a database of processed signals from the accelerometer and gyroscope in 3-axis format measuring acceleration and angular velocity. For full details on how the raw signal was processed see `features_info.file` in the original data sets:

* tBodyAcc-XYZ - Body Acceleration
* tGravityAcc-XYZ - Gravity Acceleration

_(`-XYZ` means there are 3 measurements for each of the `-X`, `-Y` and `-Z` axis.)_

From the above measurements a number of time derived signals were then calculated, and their magnitude using the Euclidean norm:

| |                                |
| --- | --- |
| tBodyAccJerk-XYZ  | Body Acceleration Jerk            |
| tBodyGyroJerk-XYZ | Body Gyroscopic Jerk              |
| tBodyAccMag       | Body Acceleration Magnitude       |
| tGravityAccMag    | Gravity Acceleration Magnitude    |
| tBodyAccJerkMag   | Body Acceleration Jerk Magnitude  |
| tBodyGyroMag      | Body Gyroscopic Magnitude         |
| tBodyGyroJerkMag  | Body Gyroscopic Jerk Magnitude    |

Then Fast Fourier Transforms (FFT) were applied to some of these signals:

|  |  |
| --- | --- |
| fBodyAcc-XYZ      | Body Acceleration FFT            |
| fBodyAccJerk-XYZ  | Body Acceleration Jerk FFT            |
| fBodyGyro-XYZ     | Body Gyroscopic FFT                   |
| fBodyAccJerkMag   | Body Acceleration Jerk Magnitude FFT  |
| fBodyGyroMag      | Body Gyroscopic Magnitude FFT         |
| fBodyGyroJerkMag  | Body Gyroscopic Jerk Magnitude FFT    |

A set of variables were then estimated from these signals.  For this data set only the following were included,

|||
| --- | --- |
| mean() | Mean value |
| std() | Standard deviation |


The complete list of variables of each feature vector in the original data set is available in `features.txt`

## Identifiers

**`subject_id`**:
In the original experiment the 30 volunteers were each given an identifying integer number from 1 - 30.

**`activity`**:
The different activities types are as follows.

| ID | Activity |
| --- | --- |
| 1 | WALKING           |
| 2 | WALKING_UPSTAIRS  |
| 3 | WALKING_DOWNSTAIRS|
| 4 | SITTING           |
| 5 | STANDING          |
| 6 | LAYING            |

## Methods

1. The data set was downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/ and unzipped into the directory `UCI HAR Dataset/`

2. The script `run_analysis.R` was run which did the following...

    1. Merge the `test` and `train` data sets
    2. Combine the `subject_id`, `activity_id` and measurements into a single data set
    3. Change the corresponding `activity_id` to an `activity` name
    4. Extract only the `-mean()` and `-std()` measurements
    5. Calculate the average of each of the above by `subject_id` and `activity`
    6. Generates a new tidy data set called `average_by_subject_by_activity.txt` in the root of the above

*(Further details can be found in the comments of `run_analysis.R`)*

## References
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

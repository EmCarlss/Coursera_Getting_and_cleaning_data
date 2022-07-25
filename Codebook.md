---
editor_options: 
  markdown: 
    wrap: sentence
---

|                                                                                   |
|------------------------------------------------------------------------|
| title: "Codebook"                                                                 |
| description: "Codebook for Coursera course project within Getting & cleaning data |
| author: "EmCarlss"                                                                |
| date: '2022-07-22'                                                                |
| output: html_document                                                             |

**Introduction**

This is document includes a codebook that has modified and updated the original codebooks available for this dataset: <https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

First follows a section describing the calculations and transformations applied already in the original data set.
After this, a section follows that describes the additional transformations that were carried out with the aim to get a tidy dataset including only a subset of the original variables (namely mean and standard deviation).

**Transformations existing already in the original dataset**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.Acc-XYZ and time.Gyro-XYZ.
These time domain signals were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.BodyAcc.XYZ and time.GravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.BodyAccJerk XYZ and time.BodyGyroJerk XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.BodyAccMag, time.GravityAccMag, time.BodyAccJerkMag, time.BodyGyroMag, time.BodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing freq.BodyAcc XYZ, freq.BodyAccJerk-XYZ, freq.BodyGyro-XYZ, freq.BodyAccJerkMag, freq.BodyGyroMag, freq.BodyGyroJerkMag.
(Note the 'freq' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:\
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time.BodyAcc XYZ\
time.GravityAcc XYZ\
time.BodyAccJerk XYZ\
time.BodyGyro XYZ\
time.BodyGyroJerk XYZ\
time.BodyAccMag\
time.GravityAccMag\
time.BodyAccJerkMag\
time.BodyGyroMag\
time.BodyGyroJerkMag\
freq.BodyAcc XYZ\
freq.BodyAccJerk XYZ\
freq.BodyGyro XYZ\
freq.BodyAccMag\
freq.BodyAccJerkMag\
freq.BodyGyroMag\
freq.BodyGyroJerkMag

Mean (mean) and standard deviation (std) was estimated from these signals.

**Additional transformations and calculations within the Coursera project:**

There exist multiple observations for each combination of subject, activity and measure in the original data set.
In the present data set I have calculated the arithemtic mean over all of these observations for each combination (subject-activity-measure).

Characters that are unsuitable for variable names in R were removed, more specically I removed "-", "(" and ")".

To make the variable names more understandable I also replaced "t" with "time" and "f" with "freq".

Column names indicating the participant were renamed as "subject.id" and the activity as "activity.id" and "activity.name" respectively.

**The list of extracted variables and their units in the present dataset**

activity.id: numerical ID for the activity name.
(1-6)\
activity.name: character (WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING)\
subject.id: ID of the subject, i.e. the participant.
(1-30)\
time.BodyAcc.mean.X: numerical, Body accelaration signal\
time.BodyAcc.mean.Y: numerical, Body accelaration signal\
time.BodyAcc.mean.Z: numerical, Body accelaration signal\
time.BodyAcc.std.X : numerical, Body accelaration signal\
time.BodyAcc.std.Y : numerical, Body accelaration signal\
time.BodyAcc.std.Z : numerical, Body accelaration signal\
time.GravityAcc.mean.X : numerical, Gravity accelaration signal\
time.GravityAcc.mean.Y : numerical, Gravity accelaration signal\
time.GravityAcc.mean.Z : numerical, Gravity accelaration signal\
time.GravityAcc.std.X : numerical, Gravity accelaration signal\
time.GravityAcc.std.Y : numerical, Gravity accelaration signal\
time.GravityAcc.std.Z : numerical, Gravity accelaration signal\
time.BodyAccJerk.mean.X : numerical, Jerk signal\
time.BodyAccJerk.mean.Y : numerical, Jerk signal\
time.BodyAccJerk.mean.Z : numerical, Jerk signal\
time.BodyAccJerk.std.X : numerical, Jerk signal\
time.BodyAccJerk.std.Y : numerical, Jerk signal\
time.BodyAccJerk.std.Z : numerical, Jerk signal\
time.BodyGyro.mean.X : numerical, time domain signal\
time.BodyGyro.mean.Y : numerical, time domain signal\
time.BodyGyro.mean.Z : numerical, time domain signal\
time.BodyGyro.std.X : numerical, time domain signal\
time.BodyGyro.std.Y : numerical, time domain signal\
time.BodyGyro.std.Z : numerical, time domain signal\
time.BodyGyroJerk.mean.X : numerical, Jerk signal\
time.BodyGyroJerk.mean.Y : numerical, Jerk signal\
time.BodyGyroJerk.mean.Z : numerical, Jerk signal\
time.BodyGyroJerk.std.X : numerical, Jerk signal\
time.BodyGyroJerk.std.Y : numerical, Jerk signal\
time.BodyGyroJerk.std.Z : numerical, Jerk signal\
time.BodyAccMag.mean : numerical, Magnitude of 3D-signal\
time.BodyAccMag.std : numerical, Magnitude of 3D-signal\
time.GravityAccMag.mean : numerical, Magnitude of 3D-signal\
time.GravityAccMag.std : numerical, Magnitude of 3D-signal\
time.BodyAccJerkMag.mean : numerical, Magnitude of 3D-signal\
time.BodyAccJerkMag.std : numerical, Magnitude of 3D-signal\
time.BodyGyroMag.mean : numerical, Magnitude of 3D-signal\
time.BodyGyroMag.std : numerical, Magnitude of 3D-signal\
time.BodyGyroJerkMag.mean : numerical, Magnitude of 3D-signal\
time.BodyGyroJerkMag.std : numerical, Magnitude of 3D-signal\
freq.BodyAcc.mean.X : numerical, FFT-transformed domain signal\
freq.BodyAcc.mean.Y : numerical, FFT-transformed domain signal\
freq.BodyAcc.mean.Z : numerical, FFT-transformed domain signal\
freq.BodyAcc.std.X : numerical, FFT-transformed domain signal\
freq.BodyAcc.std.Y : numerical, FFT-transformed domain signal\
freq.BodyAcc.std.Z : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.mean.X : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.mean.Y : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.mean.Z : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.std.X : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.std.Y : numerical, FFT-transformed domain signal\
freq.BodyAccJerk.std.Z : numerical, FFT-transformed domain signal\
freq.BodyGyro.mean.X : numerical, FFT-transformed domain signal\
freq.BodyGyro.mean.Y : numerical, FFT-transformed domain signal\
freq.BodyGyro.mean.Z : numerical, FFT-transformed domain signal\
freq.BodyGyro.std.X : numerical, FFT-transformed domain signal\
freq.BodyGyro.std.Y : numerical, FFT-transformed domain signal\
freq.BodyGyro.std.Z : numerical, FFT-transformed domain signal\
freq.BodyAccMag.mean : numerical, FFT-transformed domain signal\
freq.BodyAccMag.std : numerical, FFT-transformed domain signal\
freq.BodyBodyAccJerkMag.mean : numerical, FFT-transformed domain signal\
freq.BodyBodyAccJerkMag.std : numerical, FFT-transformed domain signal\
freq.BodyBodyGyroMag.mean : numerical, FFT-transformed domain signal\
freq.BodyBodyGyroMag.std : numerical, FFT-transformed domain signal\
freq.BodyBodyGyroJerkMag.mean: numerical, FFT-transformed domain signal\
freq.BodyBodyGyroJerkMag.std : numerical, FFT-transformed domain signal

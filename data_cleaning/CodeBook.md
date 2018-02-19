CODE BOOK
=========

Summary of:
-----------

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The acceleration signal from the smartphone accelerometer is in standard gravity units 'g'.

The angular velocity vector measured by the gyroscope is in units of radians/second.
(From UCI_HAR_Dataset\README.txt)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
(From UCI_HAR_Dataset\features_info.txt)

The data in this summary dataset are the averages, grouped by subject and activity, of all rows in the larger dataset.

Column names:
-------------

Participant on whom the data was collected (1-30)
* subject

Activity undertaken during data collection (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* activity

Body linear acceleration, time-domain signal, xyz-components, mean
* tbodyaccmeanx
* tbodyaccmeany
* tbodyaccmeanz

Body linear acceleration, time-domain signal, xyz-components, standard deviation
* tbodyaccstdx
* tbodyaccstdy
* tbodyaccstdz

Gravitational acceleration, time-domain signal, xyz-components, mean
* tgravityaccmeanx
* tgravityaccmeany
* tgravityaccmeanz

Gravitational acceleration, time-domain signal, xyz-components, standard deviation
* tgravityaccstdx
* tgravityaccstdy
* tgravityaccstdz

Body linear jerk, time-domain signal, xyz-components, mean
* tbodyaccjerkmeanx
* tbodyaccjerkmeany
* tbodyaccjerkmeanz

Body linear jerk, time-domain signal, xyz-components, standard deviation
* tbodyaccjerkstdx
* tbodyaccjerkstdy
* tbodyaccjerkstdz

Body angular velocity, time-domain signal, xyz-components, mean
* tbodygyromeanx
* tbodygyromeany
* tbodygyromeanz

Body angular velocity, time-domain signal, xyz-components, standard deviation
* tbodygyrostdx
* tbodygyrostdy
* tbodygyrostdz

Body angular jerk, time-domain signal, xyz-components, mean
* tbodygyrojerkmeanx
* tbodygyrojerkmeany
* tbodygyrojerkmeanz

Body angular jerk, time-domain signal, xyz-components, standard deviation
* tbodygyrojerkstdx
* tbodygyrojerkstdy
* tbodygyrojerkstdz

Body linear acceleration, time-domain signal, magnitude, mean
* tbodyaccmagmean

Body linear acceleration, time-domain signal, magnitude, standard deviation
* tbodyaccmagstd

Gravitational acceleration, time-domain signal, magnitude, mean
* tgravityaccmagmean

Gravitational acceleration, time-domain signal, magnitude, standard deviation
* tgravityaccmagstd

Body linear jerk, time-domain signal, magnitude, mean
* tbodyaccjerkmagmean

Body linear jerk, time-domain signal, magnitude, standard deviation
* tbodyaccjerkmagstd

Body angular velocity, time-domain signal, magnitude, mean
* tbodygyromagmean

Body angular velocity, time-domain signal, magnitude, standard deviation
* tbodygyromagstd

Body angular jerk, time-domain signal, magnitude, mean
* tbodygyrojerkmagmean

Body angular jerk, time-domain signal, magnitude, standard deviation
* tbodygyrojerkmagstd

Body linear acceleration, frequency-domain signal, xyz-components, mean
* fbodyaccmeanx
* fbodyaccmeany
* fbodyaccmeanz

Body linear acceleration, frequency-domain signal, xyz-components, standard deviation
* fbodyaccstdx
* fbodyaccstdy
* fbodyaccstdz

Body linear jerk, frequency-domain signal, xyz-components, mean
* fbodyaccjerkmeanx
* fbodyaccjerkmeany
* fbodyaccjerkmeanz

Body linear jerk, frequency-domain signal, xyz-components, standard deviation
* fbodyaccjerkstdx
* fbodyaccjerkstdy
* fbodyaccjerkstdz

Body angular velocity, frequency-domain signal, xyz-components, mean
* fbodygyromeanx
* fbodygyromeany
* fbodygyromeanz

Body angular velocity, frequency-domain signal, xyz-components, standard deviation
* fbodygyrostdx
* fbodygyrostdy
* fbodygyrostdz

Body linear acceleration, frequency-domain signal, magnitude, mean
* fbodyaccmagmean

Body linear acceleration, frequency-domain signal, magnitude, standard deviation
* fbodyaccmagstd

Body linear jerk, frequency-domain signal, magnitude, mean
* fbodyaccjerkmagmean

Body linear jerk, frequency-domain signal, magnitude, standard deviation
* fbodyaccjerkmagstd

Body angular velocity, frequency-domain signal, magnitude, mean
* fbodygyromagmean

Body angular velocity, frequency-domain signal, magnitude, standard deviation
* fbodygyromagstd

Body angular jerk, frequency-domain signal, magnitude, mean
* fbodygyrojerkmagmean

Body angular jerk, frequency-domain signal, magnitude, standard deviation
* fbodybodygyrojerkmagstd
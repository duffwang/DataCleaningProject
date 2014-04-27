DataCleaningProject Codebook
===================

###dfDataClean
Subject: The subject id between 1 and 30
Activity: The activity performed as described in activity_labels.txt
...: Each column represents a measurement, more fully described in features_info.txt of the original data set.
This dataset was cleaned up by looking only at the mean or standard deviation of the measurements.

###dfDataSummary
Subject: The subject id between 1 and 30
Activity: The activity performed as described in activity_labels.txt
...: Each column represents the mean of the measurements for the given subject and activity, more fully described in features_info.txt of the original data set.
This dataset was transformed by taking the mean of the measurements for each subject and activity.
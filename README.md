getting-cleaning-data-project-
==============================

How the script works? R code explanation.

- loads the features from features.txt
- chooses the required features, by indicating, which name in features, contains "mean" or "std"
- imports the labels from activity_labels.txt
- loads sets required to create train and test set
	- (as a part of creating these subsets) retains columns, which names contain "mean" or "std"       
- merge test and train set into one dataset
- replaces activity numeric identifiers with relevant activity types
- rearranges dataset to make averages calculation easier by using activityType and subject as factors 
- export a tidy data set with means for each participant/activity of each variable 


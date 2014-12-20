Cleaning-data-
==============

Cleaning data from human activity recognition using smartphones
Similarly was done with the train data set. move to train folder, which contains the remaining 70% of the code.

subject_train.txt to strain , the files contains subject id for the human subjects, measurement
X_train.txt to xtrain, train data set
y_train.text to ytrain, test label i.e. different activity for each measurement

The next part of the code is the merging of the test and train data sets as required in step 1 in this project.

stest and strain are merged to sall.
xtest and xtrain are merged to xall.
ytest and ytrain are merged to yall.

the unmerged data are then removed to reduce memory usage, avoid confusion and makes further steps run smoother.

stest and ytest are given names of subject_id and activity respectively, as part of step 4 in this project.

feature was converted to a character vector, then used it to give names to the coloumns of xall, again as part of step 4 in this project.

sall, ytall and xall are merged to data, with this step 1 is complete.

the next process is to replace every number in the activity colomn to its respective activity, part of step 4.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Parts of the data required in step 2 are selected. Coloumns 1,2(originally sall and yall) and coloumn containing the word mean and std, with this steps 2, 3 and 4 are completed.

Finally, data is grouped by subject_id and activity and the mean for each measurement are calculated.

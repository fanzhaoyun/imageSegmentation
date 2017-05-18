
clc;

%% F-scoreº∆À„
DBpath = 'D:\ImageSource\Weizmann_Seg_DB_2obj';
SegResultsSubPath = 'kmeans';
Resultskmeans = obj2ComputeFMeasure(DBpath,SegResultsSubPath,'win');
cd('D:\MyCode\Matlab\KFCMÀ„∑®MATLAB');
SegResultsSubPath = 'fcm';
Resultsfcm = obj2ComputeFMeasure(DBpath,SegResultsSubPath,'win');
cd('D:\MyCode\Matlab\KFCMÀ„∑®MATLAB');
SegResultsSubPath = 'kfcm';
Resultskfcm = obj2ComputeFMeasure(DBpath,SegResultsSubPath,'win');

avgkmeans = mean(Resultskmeans(:,1));
avgfcm = mean(Resultsfcm(:,1));
avgkfcm = mean(Resultskfcm(:,1));

avgrecallkmeans = mean(Resultskmeans(:,2));
avgrecallfcm = mean(Resultsfcm(:,2));
avgrecallkfcm = mean(Resultskfcm(:,2));

avgprekmeans = mean(Resultskmeans(:,3));
avgprefcm = mean(Resultsfcm(:,3));
avgprekfcm = mean(Resultskfcm(:,3));
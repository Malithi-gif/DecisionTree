
R version 4.3.1 (2023-06-16 ucrt) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> path <- 'C:/Users/USER/Desktop/New/diabetes.csv'
> dataset <- read.csv(path)
> head(datset)
Error: object 'datset' not found
> head(dataset)
  Pregnancies Glucose BloodPressure SkinThickness Insulin  BMI
1           6     148            72            35       0 33.6
2           1      85            66            29       0 26.6
3           8     183            64             0       0 23.3
4           1      89            66            23      94 28.1
5           0     137            40            35     168 43.1
6           5     116            74             0       0 25.6
  DiabetesPedigreeFunction Age Outcome
1                    0.627  50     Yes
2                    0.351  31      No
3                    0.672  32     Yes
4                    0.167  21      No
5                    2.288  33     Yes
6                    0.201  30      No
> install.packages('caTools')
Installing package into ‘C:/Users/USER/AppData/Local/R/win-library/4.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://cran.icts.res.in/bin/windows/contrib/4.3/caTools_1.18.2.zip'
Content type 'application/zip' length 245813 bytes (240 KB)
downloaded 240 KB

package ‘caTools’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\USER\AppData\Local\Temp\RtmpWaoBI8\downloaded_packages
> library(caTools)
> install.packages('party')
Installing package into ‘C:/Users/USER/AppData/Local/R/win-library/4.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.icts.res.in/bin/windows/contrib/4.3/party_1.3-13.zip'
Content type 'application/zip' length 920073 bytes (898 KB)
downloaded 898 KB

package ‘party’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\USER\AppData\Local\Temp\RtmpWaoBI8\downloaded_packages
> sample_data <- sample.split(dataset,SplitRatio = 0.8)
> train_data <- subset(dataset,sample_data == TRUE)
> test_data <- subset(dataset,sample_data == FALSE)
> library(party)
Loading required package: grid
Loading required package: mvtnorm
Loading required package: modeltools
Loading required package: stats4
Loading required package: strucchange
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Loading required package: sandwich
> model <- ctree(Outcome~ .,train_data)
Error in trafo(data = data, numeric_trafo = numeric_trafo, factor_trafo = factor_trafo,  : 
  data class “character” is not supported
In addition: Warning message:
In storage.mode(RET@predict_trafo) <- "double" : NAs introduced by coercion
> test <- data.frame( Pregnancies= c(4), Glucose= c(110), BloodPressure= c(92), SkinThickness= c(0), Insulin=c(0),BMI=c(37.6), DiabetesPedigreeFunction=c(0.191), Age=c(30)) 
> predict_test <- predict(model, test, type = "class")
> print(predict_test)
 1 
No 
Levels: No Yes
> 

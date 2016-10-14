This is the code/ directory.  
It has 3 folders and an R document.

The folders are: functions/ scripts/ and tests/ 

The functions/ folder contains one R document that has the code for all of the functions I made that go along with a linear model of a data set.  
These functions are expected to be used to multiple regression analysis.  
You can try them out by running the code through shell or gitbash using the code in the Makefile.  

The scripts/ folder contains 3 .R docuuments.  
eda-script.R and regression-script.R contain code for producing all of the images in the ../images/ folder. 
In eda-script.R you will find the code to produce histograms of pairwise comparisons of sales on variables.  
In regression-script.R you will find the code to produce the scatterplots.  
Inside both scripts you will find code to produce .RData files located in the ../data/ directory.
You can run both scripts though Makefile.

test-regression.R contains the test code to see if our functions in regression-functions.R were computed correctly.
test-regression.R uses the R package 'testtthat'

Author: Jamie Stankiewiz

Plots created and used in R

Book used for plots/graphs/data: "An Introduction to Statistical Learning" (by James et al):
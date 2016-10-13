.PHONY: all tests eda regression report clean

all: eda regression report

data:
	curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests: code/test-regression.R
	Rscript code/test-regression.R

eda: code/scripts/eda-script.R
	Rscript code/scripts/eda-script.R

regression: code/scripts/regression-script.R
	Rscript code/scripts/regression-script.R

report/report.pdf: report/report.Rmd
	cd report && Rscript -e 'library(rmarkdown); render('report.Rmd')'

clean:
	rm -f report.pdf
	
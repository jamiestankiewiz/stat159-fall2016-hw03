.PHONY: all tests eda regression report clean

all: eda regression report

data:
	curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests:

eda:

regression:

report: report/report.Rmd
	

clean:
	rm -f report.pdf
	
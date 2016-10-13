#setwd('C:/Users/Jamie/Documents/pandoc-test/stat159/stat159-fall2016-hw03/data/scripts')
ad <- read.csv('data/Advertising.csv')

#Summary of TV
summary(ad$TV)

#Summary of Radio
summary(ad$Radio)

#Summary of Newspaper
summary(ad$Newspaper)

#Summary of Sales
summary(ad$Sales)

#generating the histograms as images
png("images/histogram-tv.png")
hist(ad$TV, breaks=15, xlab='TV', main='Histogram of TV Advertisement', ylim=c(0,20))
dev.off()

png("images/histogram-radio.png")
hist(ad$Radio, breaks=15, xlab='Radio', main='Frequency of Radio')
dev.off()

png("images/histogram-newspaper.png")
hist(ad$Newspaper, breaks=15, xlab='Newspaper', main='Frequency of Newspaper', ylim=c(0,50))
dev.off()

png("images/histogram-sales.png")
hist(ad$Sales, breaks=15, xlab='Sales', main='Frequency of Sales', ylim=c(0,50))
dev.off()

#matrix of correlations
corrmat <- round(cor(ad[2:5]),4)
corrmat[lower.tri(corrmat)] <- NA

#generating pairwise scatterplots
png("images/scatterplot-matrix.png")
plot(ad[2:5])
dev.off()

#creating the txt document
sink('data/eda-output.txt')

print('Summary statistics of TV')
summary(ad$TV)

print('Summary statistics of Radio')
summary(ad$Radio)

print('Summary statistics of Newspaper')
summary(ad$Newspaper)

print('Summary statistics of Sales')
summary(ad$Sales)

print('Matrix of Correlations')
corrmat

sink()


save(corrmat, file='data/correlation-matrix.RData')

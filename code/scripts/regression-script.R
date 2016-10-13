#setwd('C:/Users/Jamie/Documents/pandoc-test/stat159/stat159-fall2016-hw03/data/scripts')
ad <- read.csv('../../data/Advertising.csv')

regression <- lm(ad)
regsum  <- summary(regression)

#generating the RData
save(regression, regsum, file='../../data/regression.RData')

#produces the residual plot, qqplot and scale-location plot
plot(regression, which=c(1:3))


png("../../images/residual-plot.png")
plot(regression,which=1)
dev.off()

png("../../images/scale-location-plot.png")
plot(regression, which =2)
dev.off()

png("../../images/normal-qq-plot.png")
plot(regression, which=3)
dev.off()

#individual scatterplots
png("../../images/scatterplot-tv-sales.png")
plot(ad$TV, ad$Sales, main='TV vs Sales', xlab= 'TV', ylab='Sales')
lm1 <- lm(Sales ~ TV, data=ad)
abline(lm1, col='red')
dev.off()

pdf("../../images/scatterplot-radio-sales.pdf")
plot(ad$Radio, ad$Sales, main='Radio vs Sales', xlab= 'Radio', ylab='Sales')
lm2 <- lm(Sales ~ Radio, data=ad)
abline(lm2, col='red')
dev.off()

pdf('../../images/scatterplot-newspaper-sales.png')
plot(ad$Newspaper, ad$Sales, main='Newspaper vs Sales', xlab= 'Radio', ylab='Sales')
lm3 <- lm(Sales ~ Newspaper, data=ad)
abline(lm3, col='red')
dev.off()
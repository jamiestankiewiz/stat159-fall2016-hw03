#setwd('C:/Users/Jamie/Documents/pandoc-test/stat159/stat159-fall2016-hw03/data/scripts')
ad <- read.csv('../../data/Advertising.csv')

regression <- lm(ad)
regsum  <- summary(regression)

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


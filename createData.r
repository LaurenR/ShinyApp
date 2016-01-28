setwd("C:/Users/Lauren/Documents/Data Products/Project/data")
data("USPersonalExpenditure")
spend <- USPersonalExpenditure
spend
Years <- c(1940, 1945, 1950, 1955, 1960)
inflateRates <- c(1, 1.29, 1.72, 1.91, 2.11)
inflation <- data.frame(Years,inflateRates)
names(inflation) <- c("Year", "CummulativeInflation")
library(reshape2)
#Category <- row.names(spend)
spendMelt <- melt(spend,id="Year")
names(spendMelt) <- c("Category", "Year", "Billions")
inflationRate <- data.frame()
inflationRate <- c(rep(inflateRates[1],5), rep(inflateRates[2],5),
                   rep(inflateRates[3],5), rep(inflateRates[4],5),
                   rep(inflateRates[5],5))
BigTable <- data.frame(spendMelt, inflationRate)

library(dplyr)
BigTable <- mutate(BigTable, InflationDollars = Billions/inflationRate)

Inflate1940 <- subset(spendMelt,Year == "1940")
rate1940 <- subset(inflation, Year == "1940")
ans <- as.data.frame(Inflate1940$Billions * rate1940[,2])
names(ans) <- "InflationAdj"
#http://www.usinflationcalculator.com/
#Inflation rates found by calculating the inflated value of $1 using 1940 as 
#the baseline

##find porportion of spending for each category in each year
library(dplyr)
Prop1940 <- subset(spendMelt,Year == "1940")
Total1940 <- sum(Prop1940[,3])
Prop1940 <- mutate(Prop1940, Proportion = Billions/Total1940)

Prop1945 <- subset(spendMelt,Year == "1945")
Total1945 <- sum(Prop1945[,3])
Prop1945 <- mutate(Prop1945, Proportion = Billions/Total1945)

Prop1950 <- subset(spendMelt,Year == "1950")
Total1950 <- sum(Prop1950[,3])
Prop1950 <- mutate(Prop1950, Proportion = Billions/Total1950)

Prop1955 <- subset(spendMelt,Year == "1955")
Total1955 <- sum(Prop1955[,3])
Prop1955 <- mutate(Prop1955, Proportion = Billions/Total1955)

Prop1960 <- subset(spendMelt,Year == "1960")
Total1960 <- sum(Prop1960[,3])
Prop1960 <- mutate(Prop1960, Proportion = Billions/Total1960)

Proportions <- rbind(Prop1940, Prop1945, Prop1950, Prop1955, Prop1960)

dim(BigTable)

SpendData <- mutate(BigTable, Proportion = Proportions$Proportion)
write.csv(SpendData, file = "SpendData.csv", row.names = FALSE)
##Table saved with spending and spending adjusted for inflation


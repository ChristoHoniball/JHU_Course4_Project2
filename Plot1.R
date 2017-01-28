# install.packages("plyr")
library(plyr)

# load data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# task 1 Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot showing
# the total PM2.5 emission from all sources for each of the years 1999, 
# 2002, 2005, and 2008.

# calculate total pm2.5 emissions for each year
pm25 <- ddply(NEI, .(year), summarise, totalEmissions = sum(Emissions))

# creating plots
png("plot1.png", width = 480, height = 480)

plot(pm25$year,pm25$totalEmissions,xlab="Year", ylab = "Total PM2.5 Emissions", pch = 19, col = "blue")

title(main = "Total PM2.5 Emissions Per Year")

dev.off()

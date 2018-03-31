

setwd("~/Coursera R Files/Module 4 Week 1/Project 2")

if (!"NEI" %in% ls()) {
  NEI <- readRDS("../summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("../Source_Classification_Code.rds")
}
png(filename = "./Plot1.png", width = 480, height = 480, units = "px")
if (!"totalEmissions" %in% ls()) {
  totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")
}
plot(totalEmissions, type = "b", pch = 13, col = "red", xlab = "Year", main = expression('Total PM'[2.5]*" Emissions in the United States from 1999 to 2008"), ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()
if (!"NEI" %in% ls()) {
  NEI <- readRDS("../summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("../Source_Classification_Code.rds")
}
if (!"CoalNEI" %in% ls()) {
  Coal <- SCC[grep("Comb.*Coal", SCC$Short.Name), "SCC"]
  CoalNEI <- NEI[NEI$SCC %in% Coal, ]
}
if (!"TData" %in% ls()) {
  TData <- ddply(CoalNEI, .(year), summarise, TotalEmissions = sum(Emissions))
}
png(filename = "Plot4.png", width = 480, height = 480, units = "px")
ggplot(TData, aes(year, TotalEmissions)) + geom_line(color = "red") + geom_point() + labs(title = "Total Emissions from Coal Combustion-Related Sources", x = "Year", y = "Total Emissions")
dev.off()
if (!"NEI" %in% ls()) {
  NEI <- readRDS("../summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("../Source_Classification_Code.rds")
}

if (!"Motor" %in% ls()) {
  Motor <- ddply(NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",], .(type, year), summarize, TotalEmissions = sum(Emissions))
}
png(filename = "Plot5.png", width = 500, height = 480, units = "px")
ggplot(Motor, aes(year, TotalEmissions)) + geom_line(color = "green") + geom_point() + labs(title = "Total Emissions from Motor Vehicles in Baltimore City", x = "Year", y = "Total Emissions")
dev.off()
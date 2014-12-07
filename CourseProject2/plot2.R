# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file = "plot2.png")

NEI.balt <- subset(NEI, fips=="24510")
ems_balt <- with(NEI.balt, aggregate(Emissions, by = list(year), sum))
plot(ems_balt, type="o", xlab="Year", ylab="Total Emissions, PM25", main="Total PM25 Emissions in Baltimore City")

dev.off()
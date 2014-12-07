# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file = "plot1.png")

ems_per_year <- tapply(NEI$Emissions, NEI$year, sum)
plot(names(ems_per_year), ems_per_year, type="o", xlab="Year", ylab="Total PM25 Emissions", 
     main="Total Emissions in the United States")

dev.off()
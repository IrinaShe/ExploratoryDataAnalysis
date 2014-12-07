# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file = "plot3.png")

NEI.balt <- NEI[NEI$fips=="24510",]
q <- qplot(year, Emissions, data=NEI.balt, stat="summary", fun.y = "sum", facets = .~type, geom=c("point", "line")) 
q + labs(title="Total PM25 Emissions in Baltimore City by Type of Source")

dev.off()

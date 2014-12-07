# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.motor <- SCC[grep("motor", SCC$Short.Name, ignore.case=TRUE), ]
SCC.ids <- SCC.motor$SCC
NEI.motor <- NEI[ NEI$SCC %in% SCC.ids, ]

NEI.motor.balt <- NEI.motor[NEI.motor$fips=="24510",]
ems_balt <- with(NEI.motor.balt, aggregate(Emissions, by = list(year), sum))
ems_balt$group <- rep("Baltimore City", length(ems_balt[,1]))

NEI.motor.la <- NEI.motor[NEI.motor$fips=="06037",]
ems_la <- with(NEI.motor.la, aggregate(Emissions, by = list(year), sum))
ems_la$group <- rep("LA City", length(ems_la[,1]))

ems_la_balt <- rbind(ems_la, ems_balt)
colnames(ems_la_balt) <- c("Year", "Emissions", "Group")

png(file = "plot6.png")
q <- qplot(Year, Emissions, data=ems_la_balt, geom = c("point", "line"), group=Group, color=Group)
q + labs(title = "Total Emissions From Motor Vehicle Sources, LA vs Baltimore")
dev.off()

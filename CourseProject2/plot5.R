# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.motor <- SCC[grep("motor", SCC$Short.Name, ignore.case=TRUE), ]
SCC.ids <- SCC.motor$SCC

NEI.motor <- NEI[ NEI$SCC %in% SCC.ids, ]
NEI.motor.balt <- NEI.motor[NEI.motor$fips=="24510",]
ems <- with(NEI.motor.balt, aggregate(Emissions, by = list(year), sum))

png(file = "plot5.png")
plot(ems, type="o", ylab="Total Emissions, PM25", main = "Total Emissions from Motor Vehicle Sources")
dev.off()

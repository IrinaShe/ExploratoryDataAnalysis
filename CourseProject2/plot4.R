# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- SCC[grepl("Coal", SCC $ EI.Sector, fixed=TRUE), "SCC"]
NEI.coal <- NEI[ NEI$SCC %in% SCC.coal, ]

png(file = "plot4.png")
ems <- tapply(NEI.coal$Emissions, NEI.coal$year, sum)
plot(names(ems), ems, type="o", xlab="Year", ylab="Total Emissions, PM25", main = "Emission from Coal combustion-related sources across US")

dev.off()

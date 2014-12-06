#importdata <- read.table("C:/Sources/Coursera/J.Hopkins/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";")
library(sqldf)

power_cons <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select*from file where Date='1/2/2007' or Date='2/2/2007' ")
power_cons[,2] <- as.POSIXct(strptime(paste(power_cons[,1], power_cons[,2]), format="%d/%m/%Y %H:%M:%S"))

png(file = "plot1.png")
hist(power_cons$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
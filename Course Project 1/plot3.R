library(sqldf)

power_cons <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select*from file where Date='1/2/2007' or Date='2/2/2007' ")
power_cons[,2] <- as.POSIXct(strptime(paste(power_cons[,1], power_cons[,2]), format="%d/%m/%Y %H:%M:%S"))

png(file = "plot3.png")

colors <- c("black", "red", "blue")
with (power_cons, plot(power_cons$Time, power_cons$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
points(power_cons$Time, power_cons$Sub_metering_1, type="l")
points(power_cons$Time, power_cons$Sub_metering_2, type="l", col=colors[2])
points(power_cons$Time, power_cons$Sub_metering_3, type="l", col=colors[3])
legend("topright", names(power_cons[7:9]), lty=1, col=colors)

dev.off()
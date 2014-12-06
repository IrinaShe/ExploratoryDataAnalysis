library(sqldf)

power_cons <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select*from file where Date='1/2/2007' or Date='2/2/2007' ")
power_cons[,2] <- as.POSIXct(strptime(paste(power_cons[,1], power_cons[,2]), format="%d/%m/%Y %H:%M:%S"))

png(file = "plot4.png")

colors <- c("black", "red", "blue")
par(mfrow=c(2,2))
with (power_cons, {
    plot(power_cons$Time, power_cons$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(power_cons$Time, power_cons$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(power_cons$Time, power_cons$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    points(power_cons$Time, power_cons$Sub_metering_1, type="l")
    points(power_cons$Time, power_cons$Sub_metering_2, type="l", col=colors[2])
    points(power_cons$Time, power_cons$Sub_metering_3, type="l", col=colors[3])
    legend("topright", names(power_cons[7:9]), lty=1, col=colors)
    plot(power_cons$Time, power_cons$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()
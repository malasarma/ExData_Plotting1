tbl <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

subtbl <- subset(tbl, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
DateTime <- strptime(paste(subtbl$Date, subtbl$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot 4
par(mfrow = c(2,2))
plot(DateTime, subtbl$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
plot(DateTime, subtbl$Voltage, type = "l", xlab="", ylab = "Voltage")
plot(DateTime, subtbl$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "l")
lines(DateTime, subtbl$Sub_metering_2, type="l", col="red")
lines(DateTime, subtbl$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DateTime, subtbl$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
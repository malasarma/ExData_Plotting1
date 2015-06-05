tbl <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

subtbl <- subset(tbl, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
DateTime <- strptime(paste(subtbl$Date, subtbl$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


plot(DateTime, subtbl$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "l")
lines(DateTime, subtbl$Sub_metering_2, type="l", col="red")
lines(DateTime, subtbl$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
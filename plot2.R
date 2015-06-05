tbl <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

subtbl <- subset(tbl, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
DateTime <- strptime(paste(subtbl$Date, subtbl$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalAP <- subtbl$Global_active_power
plot(DateTime, globalAP, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
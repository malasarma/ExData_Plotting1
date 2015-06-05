#setwd("ExploratoryDataAnalysis/Project1")

tbl <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

tbl$Date <- dmy(tbl$Date)
subtbl <- subset(tbl, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"), select = Date:Sub_metering_3)

# Plot 1
hist(subtbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
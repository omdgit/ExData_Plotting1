## Exploratory Data Analysis - Assignment 1

# load some date packages
library(lubridate)
library(chron)

# read data into data set "powc"
powc <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = c("?"), colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# convert date and time variables
powc$Date <- strptime(powc$Date, format = "%d/%m/%Y")
powc$Time <- chron(time = powc$Time)

# Create a subset of the data set by limiting it to the following dates: 2007-02-01 and 2007-02-02
powc.sub <- powc[powc$Date == "2007-02-01" | powc$Date == "2007-02-02", ]

# Create plot3.png
png(filename = "plot3.png", width  = 480, height = 480)
plot((powc.sub$Date + hms(powc.sub$Time)), powc.sub$Sub_metering_1, type = "n" ,xlab = "", ylab = "Energy sub metering")
lines((powc.sub$Date + hms(powc.sub$Time)), powc.sub$Sub_metering_1, type = "l", col = "black")
lines((powc.sub$Date + hms(powc.sub$Time)), powc.sub$Sub_metering_2, type = "l", col = "red")
lines((powc.sub$Date + hms(powc.sub$Time)), powc.sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
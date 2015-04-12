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

# Create plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(powc.sub$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()
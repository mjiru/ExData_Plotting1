

library(lubridate)

## read the data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", as.is=TRUE)

## convert date columns to data
data[,1]  <- dmy(data[,1])
data[,2]  <- hms(data[,2])

## filter only 01-02-2017 and 02-02-2017
filtered <- data[data$Date >= as.POSIXct('2007-02-01 00:00') & data$Date <= as.POSIXct('2007-02-02 23:59'),]

#clear the graphic device
dev.off()

#plot histogram
with(filtered, hist(Global_active_power,col="red", xlab="Global active power (kilowats)", main ="Global Active Power" ))

#save it
dev.copy(png,"plot1.png")
dev.off()


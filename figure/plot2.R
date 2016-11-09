

library(lubridate)

## read the data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", as.is=TRUE)

## convert date columns to data
data$date_time  <- dmy_hms( paste(data$Date, data$Time) )


## filter only 01-02-2017 and 02-02-2017
filtered <- data[data$date_time >= as.POSIXct('2007-02-01 00:00') & data$date_time <= as.POSIXct('2007-02-02 23:59'),]


#plot 
plot.new()
with(filtered, plot(y=Global_active_power, x=date_time, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#save it
dev.copy(png,"plot2.png")
dev.off()


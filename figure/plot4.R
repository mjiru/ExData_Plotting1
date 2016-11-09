

library(lubridate)

## read the data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", as.is=TRUE)

## convert date columns to data
data$date_time  <- dmy_hms( paste(data$Date, data$Time) )


## filter only 01-02-2017 and 02-02-2017
filtered <- data[data$date_time >= as.POSIXct('2007-02-01 00:00') & data$date_time <= as.POSIXct('2007-02-02 23:59'),]


#plot 
plot.new()
par(mfrow=c(2,2))

with(filtered, plot(y=Global_active_power, x=date_time, type="l", xlab = "", ylab = "Global Active Power"))
with(filtered, plot(y=Voltage, x=date_time, type="l", xlab = "datetime", ylab = "Voltage"))

with(filtered, plot(y=Sub_metering_1, x=date_time, type="l", xlab = "", ylab = "Energy Sub Metering"))
with(filtered,lines(y=Sub_metering_2, x=date_time, col="red"))
with(filtered,lines(y=Sub_metering_3, x=date_time, col="blue"))
legend( x= "topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"), lty=c(1,1), cex=0.5, bty="n")

with(filtered, plot(y=Global_reactive_power, x=date_time, type="l", xlab = "datetime", ylab = "Global Reactive Power"))




#save it
dev.copy(png,"plot4.png")
dev.off()


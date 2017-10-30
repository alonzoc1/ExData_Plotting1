#Alonzo Castanon
## A script for producing a line graph(s) of different values from dates 1/2/2007-2/2/2007
##Requires dataset named "household_power_consumption.csv" to be in same directory

##Read data
pow <- read.table("household_power_consumption.csv", sep = ";", header = TRUE, na.strings = "?")
##Subsetting dates we need
date1 <- "1/2/2007"
date2 <- "2/2/2007"
pow <- subset(pow, (as.character(Date) == date1 | as.character(Date) == date2))
##Make POSIXct data column
pow$Date <- as.Date(pow$Date, format="%d/%m/%Y")
pow$DT <- as.POSIXct(paste(pow$Date, pow$Time))
##Plot
png("plot4.png")
par(mfrow = c(2,2))
	##plot2
plot(pow$DT,pow$Global_active_power,ylab="Global Active Power (kilowatts)", xlab = "", type="l")
	##a line plot datetime vs voltage
plot(pow$DT, pow$Voltage, ylab = "Voltage", xlab = "datetime", type='l')
	##plot 3
plot(pow$DT, pow$Sub_metering_1, ylab="Energy sub metering",xlab="",type='n')
lines(pow$DT, pow$Sub_metering_1)
lines(pow$DT, pow$Sub_metering_2, col='red')
lines(pow$DT, pow$Sub_metering_3, col='blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	##A line plot datetime vs Global_reactive_Power
plot(pow$DT, pow$Global_reactive_power,ylab = "Global_reactive_power", xlab = "datetime", type = 'l')
dev.off()
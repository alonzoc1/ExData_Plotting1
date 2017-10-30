#Alonzo Castanon
## A script for producing a line graph of Global Active Power values from dates 1/2/2007-2/2/2007
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
png("plot2.png")
plot(pow$DT,pow$Global_active_power,ylab="Global Active Power (kilowatts)", xlab = "", type="l")
dev.off()
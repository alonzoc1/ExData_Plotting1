#Alonzo Castanon
## A script for producing a histogram of Global Active Power values from dates 1/2/2007-2/2/2007
##Requires dataset named "household_power_consumption.csv" to be in same directory

##Read data
pow <- read.table("household_power_consumption.csv", sep = ";", header = TRUE, na.strings = "?")
date1 <- "1/2/2007"
date2 <- "2/2/2007"
##Subsetting only the dates we need
pow <- subset(pow, (as.character(Date) == date1 | as.character(Date) == date2))
##Plotting
png('plot1.png')
hist(pow$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
dev.off()

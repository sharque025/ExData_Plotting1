#Import Data

powerdata <- "household_power_consumption.txt"
data <- read.table(powerdata, header = TRUE, sep = ";", dec= ".", na.strings = "?")
head (data)

#Subset dates

powersubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

powersubset


#Format Date and Time
datetime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powersubset$Global_active_power)
subMetering1 <- as.numeric(powersubset$Sub_metering_1)
subMetering2 <- as.numeric(powersubset$Sub_metering_2)
subMetering3 <- as.numeric(powersubset$Sub_metering_3)

#Creating the graph
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

#Run getOption("device") if plot does not show up
getOption("device")



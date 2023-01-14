#Import Data

powerdata <- "household_power_consumption.txt"
data <- read.table(powerdata, header = TRUE, sep = ";", dec= ".", na.strings = "?")
head (data)

#Subset dates
powersub<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
powersub


#Format Date and Time
datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


globalActivePower <- as.numeric(powersub$Global_active_power)


#Creating the graph
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#Run getOption("device") to show plot
getOption("device")

#Import data set

powerdata <- "household_power_consumption.txt"
data <- read.table(powerdata, header = TRUE, sep =";", dec=".", na.strings = "?")
head(data)

# Subset Feb 1 2007 and Feb 2 2007
powersub <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
head(powersub)

#Making the histogram graph
hist(powersub[,3], col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Saving as 480 x480 PNG file
png("plot1.png", width=480, height=480)
dev.off()

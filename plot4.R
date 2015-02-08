library(lubridate)

#Read the text file
hpc <- read.csv("~/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings = "?")

hsubset <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hsubset$dateTime<-paste(hsubset$Date, hsubset$Time)
hsubset$dateTime<-dmy_hms(hsubset$dateTime)

png(file = "plot4.png", width=480, height=480)
par(mfcol = c(2, 2))
with(hsubset,{
#1
plot(dateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#2
plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, Sub_metering_2, type="l", col="red")
lines(dateTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, col=c("black","red","blue"), lty=1, bty="n") 
#3
plot(dateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
#4
plot(dateTime, Global_reactive_power, type="l", ylab="global_reActive_power", xlab="datetime")
})
#dev.copy(png, file = "plot4.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()

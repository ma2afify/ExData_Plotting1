library(lubridate)

#Read the text file
hpc <- read.csv("~/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings = "?")

hsubset <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hsubset$dateTime<-paste(hsubset$Date, hsubset$Time)
hsubset$dateTime<-dmy_hms(hsubset$dateTime)

png(file = "plot3.png", width=480, height=480)
plot(hsubset$dateTime, hsubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hsubset$dateTime, hsubset$Sub_metering_2, type="l", col="red")
lines(hsubset$dateTime, hsubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1) 
#dev.copy(png, file = "plot3.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()

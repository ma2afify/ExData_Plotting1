library(lubridate)

#Read the text file
hpc <- read.csv("~/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings = "?")

hsubset <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hsubset$dateTime<-paste(hsubset$Date, hsubset$Time)
hsubset$dateTime<-dmy_hms(hsubset$dateTime)

hist(hsubset$Global_active_power, col="orangered", main="Global Active Power", xlab="Global Active Power (kilowatts)", xaxt='n')
axis(1, seq(0, 6, 2))
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()
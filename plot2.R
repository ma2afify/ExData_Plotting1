library(lubridate)

#Read the text file
hpc <- read.csv("~/ExploratoryDataAnalysis/household_power_consumption.txt", sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings = "?")

hsubset <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hsubset$dateTime<-paste(hsubset$Date, hsubset$Time)
hsubset$dateTime<-dmy_hms(hsubset$dateTime)

plot(hsubset$dateTime, hsubset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()
rm(list=ls())

library(readr)
library(dplyr)
library(data.table)

file1<-read_csv2("household_power_consumption.txt", na = "?")
data1<-subset(file1, Date %in% c("1/2/2007","2/2/2007"))
attach(data1)
data2<-data1

datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("Plot3.png")
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
points(datetime, Sub_metering_2, type = "l", col="red")
points(datetime, Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 2.5)

dev.off()

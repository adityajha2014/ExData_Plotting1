rm(list=ls())

library(readr)
library(dplyr)
library(data.table)

file1<-read_csv2("household_power_consumption.txt", na = "?")
data1<-subset(file1, Date %in% c("1/2/2007","2/2/2007"))
attach(data1)
data2<-data1

datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("Plot2.png")
plot(datetime, as.numeric(data1$Global_active_power), type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()

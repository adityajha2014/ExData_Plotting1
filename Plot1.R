rm(list=ls())

library(readr)
library(dplyr)
library(data.table)

file1<-read_csv2("household_power_consumption.txt", na = "?")
data1<-subset(file1, Date %in% c("1/2/2007","2/2/2007"))
attach(data1)
data2<-data1

datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("Plot1.png")
hist(as.numeric(Global_active_power), main = "Global Active Power", xlab = "Global_active_power (kilowatts)", col = "red")
dev.off()

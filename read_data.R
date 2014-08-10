#read data, subset and format date/time

library(data.table)
setwd("D:/classes")
complete_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
powerds=subset(complete_data, complete_data$Date %in% c("2/2/2007","1/2/2007"))


powerds$Datetime <- strptime(paste(powerds$Date, powerds$Time), 
                             format = "%d/%m/%Y %H:%M:%S")


powerds[,c(3:9)] <- apply(powerds[,c(3:9)], 2, function(x) as.numeric(x))



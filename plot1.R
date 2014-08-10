setwd("E:/Coursera/Exploratory Data Analysis")

library(sqldf)
library(ggplot2)

data <- read.csv.sql("household_power_consumption.txt",
                     sql= "select * from file where Date=
                     '1/2/2007'",sep=";" )

data2 <- read.csv.sql("household_power_consumption.txt",
                      sql= "select * from file where Date=
                     '2/2/2007'",sep=";" )

data.final <- rbind(data,data2)
rm(data,data2)

## Converting the date and time to day
data.final$day.time <- paste(data.final$Date,data.final$Time,sep="/")
data.final$day1     <- strptime(c(data.final$day.time),'%d/%m/%Y/%H:%M:%S')

## PLOT 1: Histogram
png("plot1.png")

hist.default(data.final$Global_active_power,
             main="Global Active Power",
             col="red",
             xlab ="Global Active Power")
dev.off()








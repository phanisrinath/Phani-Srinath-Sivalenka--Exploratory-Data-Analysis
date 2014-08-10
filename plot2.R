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


## PLOT2 : Globat Active Power vs Datetime
png("plot2.png")

plot(data.final$day1,data.final$Global_active_power,
     type='l',ylab="Global Active Power(kilowatts)",xlab="")

dev.off()

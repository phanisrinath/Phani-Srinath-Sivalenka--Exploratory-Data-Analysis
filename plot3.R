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

## PLOT3 : Enenrgy Sub metering vs Datetime
png("plot3.png")

par(mfrow=c(1,1))

plot(data.final$day1,data.final$Sub_metering_1,type="l",
     ylab="Energy Sub Metering", xlab="")
lines(data.final$day1,data.final$Sub_metering_2,col="red")  
lines(data.final$day1,data.final$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub-Metering 1","Sub-Metering 2","Sub-Metering 3"),
       col=c("black","red","blue"),lty=1,cex=0.75)

dev.off()

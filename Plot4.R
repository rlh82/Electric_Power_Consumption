## Import and set up the data
power<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,
                skip = 66636,nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

power$DateTime<-paste(power$Date,power$Time)
power$DateTime<-strptime(power$DateTime,format="%d/%m/%Y %H:%M:%S")

## Plot4

png("plot4.png",width = 480,height = 480, units = "px")

par(mfrow=c(2,2))


#1,1
plot(power$DateTime,power$Global_active_power,type = "n",ylab = "Global Active Power (kilowats)",xlab="")
lines(power$DateTime,power$Global_active_power)

#1,2
plot(power$DateTime,power$Voltage,type = "n",ylab = "Voltage",xlab="datetime")
lines(power$DateTime,power$Voltage)

#2,1
plot(power$DateTime,power$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab="")

legend("topright",lty = c(1,1,1),col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.75,bty="n")

lines(power$DateTime,power$Sub_metering_1)
lines(power$DateTime,power$Sub_metering_2,col = "red")
lines(power$DateTime,power$Sub_metering_3,col = "blue")

#2,2
plot(power$DateTime,power$Global_reactive_power,ylab="Global_reactive_power",type = "n",xlab="datetime")
lines(power$DateTime,power$Global_reactive_power)

dev.off()
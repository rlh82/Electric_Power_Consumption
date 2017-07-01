## Import and set up the data
power<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,
                skip = 66636,nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

power$DateTime<-paste(power$Date,power$Time)
power$DateTime<-strptime(power$DateTime,format="%d/%m/%Y %H:%M:%S")

## Plot2
png("plot2.png",width = 480,height = 480, units = "px")

plot(power$DateTime,power$Global_active_power,type = "n",ylab = "Global Active Power (kilowats)",xlab="")
lines(power$DateTime,power$Global_active_power)

dev.off()
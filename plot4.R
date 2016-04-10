#Author Arun
# This generates a 4 plots for various parameters versus time.
# with Legend
# uses png device
#usage : source("plot4.R")
#output: plot4.png file
#tested on ubuntu
#Depends on : data/household_power_consumption.txt


rd = read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
png("plot4.png",width = 480, height = 480, units="px")

par(mfcol=c(2,2),mar=c(4,4,2,2))
data1 = subset(rd,Date == "1/2/2007" | Date == "2/2/2007")
data1$Time <- paste(data1$Date,data1$Time,sep=" ")
data1$Time <- strptime(x = data1$Time,format = "%d/%m/%Y %H:%M:%S")
plot(data1$Time,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data1$Time,data1$Sub_metering_1,col="black",type="l")
lines(data1$Time,data1$Sub_metering_2,col="red",type="l")
lines(data1$Time,data1$Sub_metering_3,col="blue",type="l")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub metering 1", "Sub metering 2","Sub metering 3"))

plot(data1$Time,data1$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(data1$Time,data1$Global_reactive_power,type="l",ylab="Global reactive power",xlab="datetime")
dev.off(dev.cur())


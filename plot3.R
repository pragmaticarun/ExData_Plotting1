#Author Arun
# This generates a plot for various sub metering versus time.
# with Legend
# uses png device
#usage : source("plot3.R")
#output: plot3.png file
#tested on ubuntu
#Depends on : data/household_power_consumption.txt


rd = read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data1 = subset(rd,Date == "1/2/2007" | Date == "2/2/2007")
png("plot3.png",width = 480, height = 480, units="px")
data1$Time <- paste(data1$Date,data1$Time,sep=" ")
data1$Time <- strptime(x = data1$Time,format = "%d/%m/%Y %H:%M:%S")
plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data1$Time,data1$Sub_metering_1,col="black",type="l")
lines(data1$Time,data1$Sub_metering_2,col="red",type="l")
lines(data1$Time,data1$Sub_metering_3,col="blue",type="l")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub metering 1", "Sub metering 2","Sub metering 3"))
dev.off(dev.cur())


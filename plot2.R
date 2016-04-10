#Author Arun
# This generates a plot for Global active power versus time.
# uses png device
#usage : source("plot2.R")
#output: plot2.png file
#tested on ubuntu
#Depends on : data/household_power_consumption.txt


rd = read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data1 = subset(rd,Date == "1/2/2007" | Date == "2/2/2007")
png("plot2.png",width = 480, height = 480, units="px")
data1$Time <- paste(data1$Date,data1$Time,sep=" ")
data1$Time <- strptime(x = data1$Time,format = "%d/%m/%Y %H:%M:%S")
plot(data1$Time,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()


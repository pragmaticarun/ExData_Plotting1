#Author Arun
# This generates a histogram for Global Active Power
# uses png device
#usage : source("plot1.R")
#output: plot1.png file
#tested on ubuntu
#Depends on : data/household_power_consumption.txt

rd = read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data = subset(rd,Date == "1/2/2007" | Date == "2/2/2007")
data$Date = as.Date(data$Date,format="%d/%m/%Y")
png("plot1.png",width = 480, height = 480, units="px")
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col="red",main="Global Active Power",breaks=10)
dev.off()


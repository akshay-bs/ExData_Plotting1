##Project 1
##Exploratory Data Analysis

setwd("C:/Akshay/R/Expdata")
#D var contains all data
d <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F)

#Raw Date format is d/m/Y
bak <- d[d$Date=='1/2/2007',]
bak <- rbind(bak,d[d$Date=='2/2/2007',])

#Before manipulating copy in X only required subset to manke manipulation easy
x <- bak
x$dt <- strptime(paste0(x$Date,x$Time),format="%d/%m/%Y%H:%M:%S")
x$Global_active_power <- as.numeric(x$Global_active_power)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
x$Global_reactive_power <- as.numeric(x$Global_reactive_power)
x$Voltage <- as.numeric(x$Voltage)


#Plot 4:

png("plot4.png",width=480,height=480,units="px",bg = "transparent")

par(mfrow=c(2,2),mar=c(4,4,2,2))

#P1
plot(x$dt,x$Global_active_power,xlab="",ylab="Global Active Power",type="l")

#P2
plot(x$dt,x$Voltage,xlab="datetime",ylab="Voltage",type="l")


#P3
plot(x$dt,x$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(x$dt,x$Sub_metering_1)
lines(x$dt,x$Sub_metering_2,col="red")
lines(x$dt,x$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),bty="n",cex=0.7)

#P4
plot(x$dt,x$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")


dev.off()

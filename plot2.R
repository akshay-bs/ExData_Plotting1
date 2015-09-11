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

#Plot 2:
png("plot2.png",width=480,height=480,units="px",bg = "transparent")
plot(x$dt,x$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()

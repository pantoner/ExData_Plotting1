#import data from the working directory
setwd("~/datasciencecoursera")
#just use the dates that are needed
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip = 66637, nrows = 2880)
#Add column names
colnames(data) <- c("Date","Time", "Global_active_power" , "Global_reactive_power", "Voltage" , "Global_intensity" , "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# combine Date and Time
Date<-as.character(data$Date)
Time<-as.character(data$Time) 
data$Date1<-paste(Date,Time)
#Convert Data and time to "POSIXlt" class
data$Date<-strptime(data$Date1, "%d/%m/%Y %H:%M:%S")
data<-data[ ,-c(2,10)]
#Create plot
par(mfrow = c(1,1))
plot(data$Date,data$Sub_metering_1,type="l",ylab="Energy Sub Metering", xlab="")
lines(data$Date,data$Sub_metering_2,col="RED")
lines(data$Date,data$Sub_metering_3,col="BLUE")
legend("topright",lty = 1, col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#create plot3.png on white background
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off() 
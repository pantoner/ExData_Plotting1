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

names(data)
#Here the plot is created - with red as color  

        library(datasets)
        hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")




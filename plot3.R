# 0. Unzip the files and read the csv

unzip("exdata_data_household_power_consumption.zip")

power_data <-  read.csv("household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings="?")

data_2007 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# 1. Create the line graph and save it as a png.

data_2007$Date <- as.Date(data_2007$Date, format="%d/%m/%Y")
DateAndTime <- paste(data_2007$Date, data_2007$Time)
data_2007$DateAndTime <- as.POSIXct(DateAndTime)

png(filename="plot3.png", width=480, height=480)

plot(data_2007$DateAndTime, data_2007$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering")
lines(data_2007$DateAndTime, data_2007$Sub_metering_2,
      type="l", col="red")
lines(data_2007$DateAndTime, data_2007$Sub_metering_3,
      type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
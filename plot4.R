# 0. Unzip the files and read the csv

unzip("exdata_data_household_power_consumption.zip")

power_data <-  read.csv("household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings="?")

data_2007 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# 1. Create the graphs and save it as a png.

data_2007$Date <- as.Date(data_2007$Date, format="%d/%m/%Y")
DateAndTime <- paste(data_2007$Date, data_2007$Time)
data_2007$DateAndTime <- as.POSIXct(DateAndTime)

png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(data_2007$DateAndTime, data_2007$Global_active_power,
     type="l", xlab="", ylab="Global Active Power")

plot(data_2007$DateAndTime, data_2007$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering")
lines(data_2007$DateAndTime, data_2007$Sub_metering_2,
      type="l", col="red")
lines(data_2007$DateAndTime, data_2007$Sub_metering_3,
      type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(data_2007$DateAndTime, data_2007$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

plot(data_2007$DateAndTime, data_2007$Global_reactive_power,
     type="l", xlab="", ylab="Global Reactive Power")

dev.off()
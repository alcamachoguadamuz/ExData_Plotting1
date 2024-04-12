# 0. Unzip the files and read the csv

unzip("exdata_data_household_power_consumption.zip")

power_data <-  read.csv("household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings="?")

data_2007 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# 1. Create the line graph and save it as a png.

data_2007$Date <- as.Date(data_2007$Date, format="%d/%m/%Y")
DateAndTime <- paste(data_2007$Date, data_2007$Time)
data_2007$DateAndTime <- as.POSIXct(DateAndTime)

png(filename="plot2.png", width=480, height=480)
plot(data_2007$DateAndTime, data_2007$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
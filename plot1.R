# 0. Unzip the files and read the csv

unzip("exdata_data_household_power_consumption.zip")

power_data <-  read.csv("household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings="?")

data_2007 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# 1. Create the histogram and save it as a png.

png(filename="plot1.png", width=480, height=480)
hist(data_2007$Global_active_power, main="Global Active Power", col="Red",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

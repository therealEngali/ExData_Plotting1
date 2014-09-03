#Found the set of data through trial and error using skip and nrows 
data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, skip= 66636, nrow=2880, na.string = "?")
#Assigned column names 
colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", 
                   "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

#Save to a png file; default width and height is 480
png(filename = "plot1.png")


#Created histogram with all the attributes required
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

##Close the png device
dev.off() 



#Found the set of data through trial and error using skip and nrows 
data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, skip= 66636, nrow=2880, stringsAsFactors = FALSE, na.strings = "?")
#Assigned column names 
colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", 
                   "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
##Converting date and time factors to date format
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Save to a png file; default width and height is 480
png(filename = "plot3.png")

#Plot sub metering energy usage over date
plot(data$Date, data$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2,type="l", col = "red")
lines(data$Date, data$Sub_metering_3,type="l", col = "blue")
legend("topright", lwd = 2, col = c("black","blue","red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


##Close the png device
dev.off() 

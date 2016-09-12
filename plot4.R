#reading the file 
#dont forget to put the txt on the work directory
dtweek1 <- read.table("household_power_consumption.txt", header = T,sep=";",dec = ".",na.strings = "?")
#filtering data to use less memory
dtweek1_filtered <- dtweek1[dtweek1$Date=="1/2/2007"|dtweek1$Date=="2/2/2007",]
#transforming the columns to make easier the graphs
dtweek1_filtered$Date <- as.Date(dtweek1_filtered$Date, format = "%d/%m/%Y")
dtweek1_filtered$Time <- strptime(paste(dtweek1_filtered$Date, dtweek1_filtered$Time), format = "%Y-%m-%d %H:%M:%S")

#creating a png file with the correct name
png(filename = "plot4.png", width = 480, height = 480)
#ploting 
#transforming the area for 4 graphs 
par(mfrow = c(2,2))
plot(dtweek1_filtered$Time, dtweek1_filtered$Global_active_power, type = "line", xlab = "", ylab = "Global Activer Power (kilowatts)")
plot(dtweek1_filtered$Time, dtweek1_filtered$Voltage, type = "line", xlab = "datetime", ylab = "Voltage")
plot(dtweek1_filtered$Time, dtweek1_filtered$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
legend("topright",bty = "n", box.lwd = 1, lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c( "black", "red", "blue"))
points(dtweek1_filtered$Time, dtweek1_filtered$Sub_metering_1, type = "line", col = "black")
points(dtweek1_filtered$Time, dtweek1_filtered$Sub_metering_2, type = "line", col = "red")
points(dtweek1_filtered$Time, dtweek1_filtered$Sub_metering_3, type = "line", col = "blue")
plot(dtweek1_filtered$Time, dtweek1_filtered$Global_reactive_power, type = "line", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

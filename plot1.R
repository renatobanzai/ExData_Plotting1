#reading the file 
#dont forget to put the txt on the work directory
dtweek1 <- read.table("household_power_consumption.txt", header = T,sep=";",dec = ".",na.strings = "?")
#filtering data to use less memory
dtweek1_filtered <- dtweek1[dtweek1$Date=="1/2/2007"|dtweek1$Date=="2/2/2007",]
#transforming the columns to make easier the graphs
dtweek1_filtered$Date <- as.Date(dtweek1_filtered$Date, format = "%d/%m/%Y")
dtweek1_filtered$Time <- strptime(paste(dtweek1_filtered$Date, dtweek1_filtered$Time), format = "%Y-%m-%d %H:%M:%S")
#creating a png file
png(filename = "plot1.png", width = 480, height = 480)
#ploting the graphic
hist(dtweek1_filtered$Global_active_power,col = "red", xlab = "Global Activer Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
#closing the file
dev.off()


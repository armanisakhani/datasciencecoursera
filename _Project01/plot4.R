data <- read.table(file = "household_power_consumption.txt" ,nrow = 5 , sep = ";" , header = T)
data <- read.table(file = "household_power_consumption.txt" , sep = ";" ,
                   header = T , col.names = colnames(data) )

data$Date <- as.Date(as.character(data$Date) , format = "%d/%m/%Y")
data <- data[(1:nrow(data))[ data$Date == as.Date("2007-02-01") |
                                   data$Date == as.Date("2007-02-02")] , ]
data$datetime <- as.POSIXct(paste(data$Date, data$Time, sep = "-"), format = "%Y-%m-%d-%X")

## Creat plot4.png

png(filename = "plot4.png" , width = 480 , height = 480)
par(mfrow = c(2,2))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power) )
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power) )
data$Voltage <- as.numeric(as.character(data$Voltage))

with(data = data, plot(datetime, Global_active_power, type = "n", lwd = 0.5, ylab = "Global Active Power (killowatts)", xlab = ""))
lines(x = data$datetime, y = data$Global_active_power, type = "l", lwd = 0.5)

with(data = data, plot(datetime, Voltage, type = "n", ylab = "Voltage", lwd = 0.5))
lines(x = data$datetime, y = data$Voltage, type = "l", lwd = 0.5)

with(data = data, plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "n",
                       ylab = "Energy sub metering", xlab = "", lwd = 0.5))
with(data , lines(datetime, as.numeric(as.character(Sub_metering_1)), type = "l" , col = "black", lwd = 0.5))
with(data , lines(datetime, as.numeric(as.character(Sub_metering_2)), type = "l" , col = "red", lwd = 0.5))
with(data , lines(datetime, as.numeric(as.character(Sub_metering_3)), type = "l" , col = "blue", lwd = 0.5))
legend("topright", pch = "--",bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data = data, plot(datetime, Global_reactive_power, type = "n", xlab = "",
                       lwd = 0.5))
lines(x = data$datetime, y = data$Global_reactive_power, type = "l", lwd = 0.5)

dev.off()


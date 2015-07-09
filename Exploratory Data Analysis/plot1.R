data <- read.table(file = "household_power_consumption.txt" ,nrow = 5 , sep = ";" , header = T)
data <- read.table(file = "household_power_consumption.txt" , sep = ";" ,
                   header = T , col.names = colnames(data) )

data$Date <- as.Date(as.character(data$Date) , format = "%d/%m/%Y")
data <- data[(1:nrow(data))[ data$Date == as.Date("2007-02-01") |
                                   data$Date == as.Date("2007-02-02")] , ]

# data <- data[(1:length(data))[as.character(data$Global_active_power) == "?"],]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power) )

png(filename = "plot1.png" , width = 480 , height = 480)
hist(x = data$Global_active_power , main = "Global Active Power" , xlab = "Global Active Power (killowatts)" , col = "red")
dev.off()

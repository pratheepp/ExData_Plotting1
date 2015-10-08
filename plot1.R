data <- read.table("household_power_consumption.txt", sep=";", colClasses = c("character","character", rep("numeric",7) ), header = TRUE,na.strings=c("?") )
data$Date <- as.Date(data$Date,"%d/%m/%Y")
feb_2_days <- data[ data$Date >= "2007-02-01" &  data$Date <= "2007-02-02",  ]
png("plot1.png")
hist(feb_2_days$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
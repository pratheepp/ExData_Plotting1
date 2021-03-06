data <- read.table("household_power_consumption.txt", sep=";", colClasses = c("character","character", rep("numeric",7) ), header = TRUE,na.strings=c("?") )
data$Date_2 <- as.Date(data$Date,"%d/%m/%Y")
feb_2_days <- data[ data$Date_2 >= "2007-02-01" &  data$Date_2 <= "2007-02-02",  ]
feb_2_days$DateTime <- strptime(paste(feb_2_days$Date, feb_2_days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png")
plot(feb_2_days$DateTime, feb_2_days$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(feb_2_days$DateTime, feb_2_days$Sub_metering_2, type="l", col="red")
lines(feb_2_days$DateTime, feb_2_days$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()

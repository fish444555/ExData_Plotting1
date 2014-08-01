data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
data1 = data[with(data, Date == "1/2/2007" | Date == "2/2/2007"), ]
tm = strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))
with(data1,{
  plot(tm, Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab = "")
  
  plot(tm, Voltage, type="l", ylab = "Voltage", xlab = "datetime")
  
  plot(tm, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  with(subset(data1), lines(tm, Sub_metering_2, col = "red"))
  with(subset(data1), lines(tm, Sub_metering_3, col = "blue"))
  legend("topright", pch = "__", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(tm, data1$Global_reactive_power, type="l", ylab = "Global Reactive Power", xlab = "datetime")
})

dev.copy(png,file = "plot4.png")
dev.off()

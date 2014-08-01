data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
data1 = data[with(data, Date == "1/2/2007" | Date == "2/2/2007"), ]
tm = strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

plot(tm, data1$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.copy(png,file = "plot2.png")
dev.off()

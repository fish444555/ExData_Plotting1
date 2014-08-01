data=read.csv("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
tday=array(data[,1])
d1="01/02/2007"
d2="02/02/2007"
idx=which(as.Date(tday,"%d/%m/%Y")==as.Date(d1,"%d/%m/%Y")|as.Date(tday,"%d/%m/%Y")==as.Date(d2,"%d/%m/%Y"))
data1=data[idx,]
p1=hist(data1$Global_active_power,main="Global Active Power",col="red")
dev.copy(png,file = "plot1.png")
dev.off()

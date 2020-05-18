## Plot 1

getwd()
filename<- "exdata_data_household_power_consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}

if (file.exists("exdata_data_household_power_consumption.zip")) { 
  unzip(filename) 
}

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

summary(power)
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#calling the basic plot function
png("plot1.png", width=480, height=480)
hist(as.numeric(levels(subpower$Global_active_power))[subpower$Global_active_power],col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()



## Plot4.R

powerdata <- read.csv("C:/R_Working_Directory/PowerData/household_power_consumption.txt",
                      header = TRUE, sep = ";", na.strings="?")

powerdata2 <- powerdata[as.Date(powerdata$Date, 
                                "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
library(dplyr)
library(plyr)

powerdata3 = mutate(powerdata2, datetime= paste(powerdata2$Date,powerdata2$Time))

powerdata4 = mutate(powerdata3, datetime2 = strptime(powerdata3$datetime, "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(2,2))
mar = c(4,4,2,1)

plot(powerdata4$datetime2,powerdata4$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "", cex = .5)


plot(powerdata4$datetime2,powerdata4$Voltage, type = "l", ylab = "Voltage",
     xlab = "", cex = .5)

plot(powerdata4$datetime2,powerdata4$Sub_metering_1, type = "l", ylab = "Energy sub metering", cex = .5)
points(powerdata4$datetime2,powerdata4$Sub_metering_2, type="l", col="Red")
points(powerdata4$datetime2,powerdata4$Sub_metering_3, type="l", col="Blue")
legend("topright", legend = c("sub_metering 1","sub_metering 2","sub_metering 3"), lty=c(1,1), col=c("black","red","blue"),lwd=c(1,1), cex = 0.45)


plot(powerdata4$datetime2,powerdata4$Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "", cex = .6)

dev.copy(png, file = "Plot4.png")

dev.off()

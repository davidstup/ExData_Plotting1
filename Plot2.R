## Plot2.R

powerdata <- read.csv("C:/R_Working_Directory/PowerData/household_power_consumption.txt",
                      header = TRUE, sep = ";", na.strings="?")

powerdata2 <- powerdata[as.Date(powerdata$Date, 
                                "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
library(dplyr)
library(plyr)

powerdata3 = mutate(powerdata2, datetime= paste(powerdata2$Date,powerdata2$Time))

powerdata4 = mutate(powerdata3, datetime2 = strptime(powerdata3$datetime, "%d/%m/%Y %H:%M:%S"))

par( mar = c(2,4,2,3) )

plot(powerdata4$datetime2,powerdata4$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.copy(png, file = "Plot2.png")

dev.off()

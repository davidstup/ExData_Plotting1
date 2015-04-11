## Plot1.R

powerdata <- read.csv("C:/R_Working_Directory/PowerData/household_power_consumption.txt",
                      header = TRUE, sep = ";", na.strings="?")

powerdata2 <- powerdata[as.Date(powerdata$Date, 
                                "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

par( mar = c(2,3,2,3) )

hist(powerdata2$Global_active_power, col="red", 
     main = "Global Active Power", xlab  = "Global Active Power (kilowatts)"
)

dev.copy(png, file = "Plot1.png")

dev.off()

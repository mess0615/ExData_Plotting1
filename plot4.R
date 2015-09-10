library(dplyr)
energy <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE)
energy <- energy %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
                     mutate(Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") %>% as.character())
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(as.POSIXlt(energy$Datetime), energy$Global_active_power, xlab = "",
     ylab = "Global Active Power", type = "l")
plot(as.POSIXlt(energy$Datetime), energy$Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l")
plot(as.POSIXlt(energy$Datetime), energy$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
lines(as.POSIXlt(energy$Datetime), energy$Sub_metering_2, col = "red")
lines(as.POSIXlt(energy$Datetime), energy$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1,
       col = c("black", "red", "blue"), bty = "n")
plot(as.POSIXlt(energy$Datetime), energy$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")
dev.off()
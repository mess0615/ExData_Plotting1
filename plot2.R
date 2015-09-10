library(dplyr)
energy <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE)
energy <- energy %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
                     mutate(Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") %>% as.character())
png(filename = "plot2.png", width = 480, height = 480)
plot(as.POSIXlt(energy$Datetime), energy$Global_active_power, xlab = "",
                                  ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
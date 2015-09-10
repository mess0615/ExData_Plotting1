library(dplyr)
energy <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE)
energy <- energy %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
                     mutate(Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") %>% as.character())
png(filename = "plot1.png", width = 480, height = 480)
hist(energy$Global_active_power, main = "Global Active Power",
                                 xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
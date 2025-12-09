library(data.table)
library(lubridate)

# read data from downloaded file
data <- fread("electric_power.txt", na.strings = "?")

# filtering dates for graph
data <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") , ]

# png graph on device
png("plot1.png", width = 480, height = 480)

# histogram plot of Global Active Power
hist(
    dt$Global_active_power,
    xlab = "Global Active Power (kilowatts)",
    ylab = "frequency",
    main = "Global Active Power",
    col = "Red"
)

dev.off()
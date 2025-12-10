library(data.table)
library(lubridate)

# loading data
dt <- fread("power.txt", na.strings = "?")

# filterisation of specified dates
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") ,]

# conversion of date-time
dateTime <- dmy_hms(paste(dt$Date, dt$Time, sep = " "), tz = "UTC")

# plotting the figure
png("plot3.png", width = 480, height = 480)

plot(
    dateTime,
    dt$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)
lines(dateTime, dt$Sub_metering_2, col = "red")
lines(dateTime, dt$Sub_metering_3, col = "blue")
legend(
    "topright",
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1,
    lwd = 1
)

dev.off()
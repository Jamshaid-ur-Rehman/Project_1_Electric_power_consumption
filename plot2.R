library(data.table)
library(lubridate)

# loading data
dt <- fread("power.txt", na.strings = "?")

# filterisation of specified dates
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") ,]

# conversion of date-time
dateTime <- dmy_hms(paste(dt$Date, dt$Time, sep = " "), tz = "UTC")

png("plot2.png", width = 480, height = 480)

# plotting the figure
plot(
    dateTime,
    dt$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)

dev.off()
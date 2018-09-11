

library(data.table)

dat <- fread("data/household_power_consumption.txt", na.strings = "?")
dat <- dat[with(dat, Date %in% c("1/2/2007","2/2/2007")), ]

datetime <- with(dat, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png(file = "plot4.png", width=480, height=480)

par(mfrow = c(2,2))

# First column in the first row
with(dat, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = ""))

# second column in the first row
with(dat, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

# First column in the second row
with(dat, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub merting", xlab = ""))
with(dat, lines(datetime, Sub_metering_2, type = "l", col="red"))
with(dat, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"),
                   legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Second column in the second row
with(dat, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
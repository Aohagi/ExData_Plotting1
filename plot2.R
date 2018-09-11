
library(data.table)

dat <- fread("data/household_power_consumption.txt", na.strings = "?")
dat <- dat[with(dat, Date %in% c("1/2/2007","2/2/2007")), ]

png(file = "plot2.png", width=480, height=480)

datetime <- with(dat, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
with(dat, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = ""))


dev.off()
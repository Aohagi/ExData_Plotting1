
library(data.table)

dat <- fread("data/household_power_consumption.txt", na.strings = "?")
dat <- dat[with(dat, Date %in% c("1/2/2007","2/2/2007")), ]

png(file = "plot1.png", width=480, height=480)

hist(dat$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power" )

dev.off()

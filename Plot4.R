# Plot 4

dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
head(dat)
dim(dat)
tail(dat)
str(dat)

# Subsetting the need days
datsub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dim(datsub)

## Formatting dates
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# 
datsub$daytime <- paste(datsub$Date, datsub$Time)
datsub <- cbind(daytime, datsub)
datsub$daytime <- as.POSIXct(daytime)


## Formatting dates
datsub$Date <- as.Date(datsub$Date, format="%d/%m/%Y")
daytime <- paste(as.Date(datsub$Date), datsub$Time)
datsub <- cbind(daytime, datsub)
datsub$daytime <- as.POSIXct(daytime)
View(datsub)


# Plot 4
par(mfrow=c(2,2))
#plot1
plot(datsub$Global_active_power ~ datsub$daytime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
#plot2
with(datsub, plot(Voltage ~ daytime, type="l", ylab="Voltage"))
#plot2
plot (datsub$Sub_metering_1 ~ datsub$daytime, type="l", ylab = "Energy sub metering", xlab="")
lines(datsub$Sub_metering_2 ~ datsub$daytime, col="red")
lines(datsub$Sub_metering_3 ~ datsub$daytime, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1) )
#plot3 / 4
with(datsub, plot(Global_reactive_power ~ daytime, type="l", ylab="Voltage"))

dev.copy(png,"Plot4.png", width=480, height=480)
dev.off()
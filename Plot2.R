# Plot 2

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


# Plot 2
plot(datsub$Global_active_power ~ datsub$daytime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

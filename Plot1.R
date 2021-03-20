# Plot 1

dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
head(dat)
dim(dat)

# Subsetting the need days
datsub <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dim(datsub)

# Checking data
str(datsub)
head(datsub)

#Plot 1
hist(datsub$Global_active_power, col="red", 
     main="Global Active Power",      
     xlab="Global Active power (kilowatts)")

dev.copy(png,"plot1.png", width=480, heigh=480)
dev.off()
setwd("~/test/coursera")
##
if (!file.exists("EDA")) {dir.create("EDA")}
dat <- read.table(file="../coursera/EDA/household_power_consumption.txt", sep=";", header=T, na.strings="?")
dat1 <- dat
dat1$Date1 <- as.POSIXct(as.Date(dat1$Date, format="%d/%m/%Y"))
dat1$Date2 <- paste(dat$Date, dat$Time)
dat1$Time2 <- as.POSIXct(strptime(dat1$Date2, "%d/%m/%Y %H:%M:%S"))
dat2 <- dat1 %>%
  filter(Date1 >= as.POSIXct(as.Date("2007-02-01", format="%Y-%m-%d")) & 
           Date1 <= as.POSIXct(as.Date("2007-02-02", format="%Y-%m-%d")))

png("plot4.png", width=480, height=480)

par(mfcol=c(2, 2))

with(dat2, plot(Time2, Global_active_power, type="l", lwd=1,
     xlab="", ylab="Global Active Power (kilowatts)"))

with(dat2, {
  plot(Time2, Sub_metering_1, type="l", lwd=1, xlab="", ylab="Energy sub metering")#  type="l", lwd=1)
  lines(Time2, Sub_metering_1, lty=1)
  lines(Time2, Sub_metering_2, lty=1, col="red")
  lines(Time2, Sub_metering_3, lty=1, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

with(dat2, plot(Time2, Voltage, type="l", lwd=1,
     xlab="datetime", ylab="Voltage"))

with(dat2, plot(Time2, Global_reactive_power, type="l", lwd=1,
                xlab="", ylab="Global_reactive_power"))

dev.off( )    ## Don’t forget to close the PNG device!

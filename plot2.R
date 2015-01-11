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

png("plot2.png", width=480, height=480)

plot(dat2$Time2, dat2$Global_active_power, type="l", lwd=1,
     main = "Glolbal Active Power", ylab="Global Active Power (kilowatts)", xlab="")

dev.off( )    ## Don’t forget to close the PNG device!



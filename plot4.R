# Another approach to process the original data at OS level using :
# grep -e "^[12]/2/2007" -e "^D" household_power_consumption.txt > 2007.txtmydata <- read.table("2007.txt",na.strings ="?",sep=";", header=TRUE)
mydata <- read.table("2007.txt",na.strings ="?",sep=";", header=TRUE)

# t1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings ="?")
# mydata <- t1[t1$Date %in% c("1/2/2007","2/2/2007"),]
mydata <- cbind(datetime=strptime(paste(mydata$Date, mydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S"),mydata[,-(1:2)])

with(mydata, {
        windows(7,7)
        par(mfrow=c(2,2),mar=c(4,4,1,1))
        plot(datetime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        plot(datetime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright", bty="n", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
               , inset=c(0.04,0))
        plot(datetime, Global_reactive_power, xlab="datetime", ylab="Global Reactive Power", type="l")
} )

dev.copy(png, file = "plot4.png")
dev.off()
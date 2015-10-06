# Another approach to process the original data at OS level using :
# grep -e "^[12]/2/2007" -e "^D" household_power_consumption.txt > 2007.txtmydata <- read.table("2007.txt",na.strings ="?",sep=";", header=TRUE)
mydata <- read.table("2007.txt",na.strings ="?",sep=";", header=TRUE)

# t1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings ="?")
# mydata <- t1[t1$Date %in% c("1/2/2007","2/2/2007"),]
mydata <- cbind(datetime=strptime(paste(mydata$Date, mydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S"),mydata[,-(1:2)])

with(mydata, {
        windows(7,7)
        par(mfrow=c(1,1), mar=c(4,4,1,2))
        plot(datetime, Global_active_power, xlab="", ylab="Global Active Power (killowatts)", type="l")
} )

dev.copy(png, file = "plot2.png")
dev.off()
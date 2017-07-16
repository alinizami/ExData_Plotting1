
##plot 4
## loading and cleaning dates
dt_full<-fread("./data/household_power_consumption.txt",sep = ";")
head(dt_full)
dt_full$Date <- as.Date(dt_full$Date, format = "%d/%m/%Y")
dt_subset<- subset(dt_full, subset = (Date>="2007-02-01" & Date<="2007-02-02"))
datetime <- paste(as.Date(dt_subset$Date), dt_subset$Time)
dt_subset$Datetime <- as.POSIXct(datetime)

##creating graphs
 par(mfrow= c(2,2))
 plot(dt_subset$Global_active_power ~ dt_subset$Datetime, type = "l", ylab = "Global Active Power (Kilowatts)")
 plot(dt_subset$Voltage ~ dt_subset$Datetime, type = "l", ylab = "Voltage", xlab= "datetime")
 with(dt_subset,plot(dt_subset$Datetime, dt_subset$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")) 
 lines(dt_subset$Datetime,as.numeric(dt_subset$Sub_metering_1)  , col="Black")
 lines(dt_subset$Datetime,as.numeric(dt_subset$Sub_metering_2)  , col="Red")
 lines(dt_subset$Datetime,as.numeric(dt_subset$Sub_metering_3)  , col="Blue")
 legend("topright",  lwd = 1 ,col= c("Black","Red","Blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), cex=0.6)
 plot(dt_subset$Global_reactive_power ~ dt_subset$Datetime, type = "l", ylab = "Global_reactive_power", xlab= "datetime")

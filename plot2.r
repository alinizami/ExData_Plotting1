## plot 2
## loading and cleaning dates
dt_full<-fread("./data/household_power_consumption.txt",sep = ";")
head(dt_full)
dt_full$Date <- as.Date(dt_full$Date, format = "%d/%m/%Y")
dt_subset<- subset(dt_full, subset = (Date>="2007-02-01" & Date<="2007-02-02"))
datetime <- paste(as.Date(dt_subset$Date), dt_subset$Time)
dt_subset$Datetime <- as.POSIXct(datetime)
## creating graph
plot(dt_subset$Global_active_power ~ dt_subset$Datetime, type = "l", ylab = "Global Active Power (Kilowatts)")

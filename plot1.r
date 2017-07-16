## plot 1
## loading and cleaning dates
dt_full<-fread("./data/household_power_consumption.txt",sep = ";")
head(dt_full)
dt_full$Date <- as.Date(dt_full$Date, format = "%d/%m/%Y")
dt_subset<- subset(dt_full, subset = (Date>="2007-02-01" & Date<="2007-02-02"))
## creating graph
hist(as.numeric(dt_subset$Global_active_power),col = "Red", xlab = "Global Active Power(kilowatts)", main="Global Active Power")

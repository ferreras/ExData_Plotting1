# First Graph
library(data.table)

Plot1 <- function(){
    
    # Reading data
    myTable <- read.table(file="./household_power_consumption.txt",
                          header = TRUE, sep=";", na.strings ="?",
                          colClasses = c("character", "character",
                               "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric",
                               "numeric"))
    
    myDT <- data.table(myTable[myTable$Date == "1/2/2007" | myTable$Date == "2/2/2007",])
    myDT[,datetime:=as.POSIXct(strptime(paste(Date,Time, sep =" "), format = "%d/%m/%Y %H:%M:%S"))]
    myDT$Date <- NULL
    myDT$Time <- NULL
# Plot 1
    hist(myDT$Global_active_power, col="red",xlab= "Global Active Power (kilowatts)", main = "Global Active Power", )
#Plot 2
    plot(myDT$datetime, myDT$Global_active_power, ylab= "Global Active Power (kilowatts)",xlab ="", type ="l")
#Plot 3
plot(myDT$datetime, myDT$Sub_metering_1, type="l",col="black", ylab= "Energy sub metering",xlab ="")
points(myDT$datetime, myDT$Sub_metering_2, type="l",col="red")
points(myDT$datetime, myDT$Sub_metering_3, type="l",col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plot 4
par(mfrow = c(2,2))
#..
plot(myDT$datetime, myDT$Global_active_power, ylab= "Global Active Power",xlab ="", type ="l")
#..
plot(myDT$datetime, myDT$Voltage, ylab= "Voltage",xlab ="", type ="l")
#..
plot(myDT$datetime, myDT$Sub_metering_1, type="l",col="black", ylab= "Energy sub metering",xlab ="")
points(myDT$datetime, myDT$Sub_metering_2, type="l",col="red")
points(myDT$datetime, myDT$Sub_metering_3, type="l",col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#..
plot(myDT$datetime, myDT$Global_reactive_power, ylab= "Global Reactive Power",xlab ="", type ="l")
}
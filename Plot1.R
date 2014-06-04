#
# COURSERA
# Exploratory Data Analysis
# June 4th, 2013
# Peer Assessments / Course Project 1
#

# Load library for working with Data Tables
library(data.table)

# Histogram Global Active Power
Plot1 <- function(){
    
    # Reading data from file (located in the working directory
    myTable <- read.table(file="./household_power_consumption.txt",
                          header = TRUE, sep=";", na.strings ="?",
                          colClasses = c(rep("character", 2),
                                         rep("numeric", 7)))
    
    # Convert to a Data Table. Select only rows "1/2/2007" and "2/2/2007"                     
    myDT <- data.table(myTable[myTable$Date == "1/2/2007" | myTable$Date == "2/2/2007",])

    # Add a column with Date and Tome in a POSIXct Format
    myDT[,datetime:=as.POSIXct(strptime(paste(Date,Time, sep =" "), 
                                        format = "%d/%m/%Y %H:%M:%S"))]
    
    # Plot 1
    par(mfrow = c(1,1))
    hist(myDT$Global_active_power, col="red",
         xlab= "Global Active Power (kilowatts)", 
         main = "Global Active Power", );
    dev.copy(png,file="Plot1.png")
    dev.off()
    
    #Plot 2
    par(mfrow = c(1,1))
    plot(myDT$datetime, myDT$Global_active_power, 
         ylab= "Global Active Power (kilowatts)",xlab ="", type ="l")
    dev.copy(png,file="Plot2.png")
    dev.off()
    
    #Plot 3
    par(mfrow = c(1,1))
    plot(myDT$datetime, myDT$Sub_metering_1, type="l",col="black", 
         ylab= "Energy sub metering",xlab ="")
    points(myDT$datetime, myDT$Sub_metering_2, type="l",col="red")
    points(myDT$datetime, myDT$Sub_metering_3, type="l",col="blue")
    legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.copy(png,file="Plot3.png")
    dev.off()

    #Plot 4
    par(mfrow = c(2,2))
    
    plot(myDT$datetime, myDT$Global_active_power, 
         ylab= "Global Active Power",xlab ="", type ="l")
    
    plot(myDT$datetime, myDT$Voltage, ylab= "Voltage",
         xlab ="", type ="l")
    
    plot(myDT$datetime, myDT$Sub_metering_1, type="l",col="black", 
         ylab= "Energy sub metering",xlab ="")
    points(myDT$datetime, myDT$Sub_metering_2, type="l",col="red")
    points(myDT$datetime, myDT$Sub_metering_3, type="l",col="blue")
    legend("topright", col = c("black", "red", "blue"), bty = "n", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    plot(myDT$datetime, myDT$Global_reactive_power, ylab= "Global Reactive Power",xlab ="", type ="l")
    dev.copy(png,file="Plot4.png")
    dev.off()

}
#
# COURSERA
# Exploratory Data Analysis
# June 4th, 2013
# Peer Assessments / Course Project 1
#

# Load library for working with Data Tables
library(data.table)

# Plot 4 Drawings
plot4 <- function(){
    
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
    dev.copy(png,file="plot4.png", pointsize=8)
    dev.off()
    
}
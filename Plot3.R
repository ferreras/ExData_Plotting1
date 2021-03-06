#
# COURSERA
# Exploratory Data Analysis
# June 4th, 2013
# Peer Assessments / Course Project 1
#

# Load library for working with Data Tables
library(data.table)

# Plot Energy sub metering
plot3 <- function(){
    
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
        
    #Plot 3
    
    #WeekDays in English
    Sys.setlocale("LC_TIME","English")
    
    par(mfrow = c(1,1), mar = c(5.1,5.1,4.1,2.1))
    
    plot(myDT$datetime, myDT$Sub_metering_1, type="l",col="black", 
         ylab= "Energy sub metering",xlab ="")
    points(myDT$datetime, myDT$Sub_metering_2, type="l",col="red")
    points(myDT$datetime, myDT$Sub_metering_3, type="l",col="blue")
    legend(myDT$datetime[floor(0.60*length(myDT$datetime))], 40, bty="n", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty=c(1,1), lwd=c(2.5,2.5))

    # Copy to PNG
    dev.copy(png,file="plot3.png", pointsize=8)
    dev.off()
    
    # Return language to normality
    Sys.setlocale("LC_TIME","Spanish_Spain.1252")
    
}
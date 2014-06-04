#
# COURSERA
# Exploratory Data Analysis
# June 4th, 2013
# Peer Assessments / Course Project 1
#

# Load library for working with Data Tables
library(data.table)

# Plot Global Active Power
plot2 <- function(){
    
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

    
    #Plot 2
    par(mfrow = c(1,1))
    plot(myDT$datetime, myDT$Global_active_power, 
         ylab= "Global Active Power (kilowatts)",xlab ="", type ="l")
    dev.copy(png,file="plot2.png", pointsize=8)
    dev.off()
       
}
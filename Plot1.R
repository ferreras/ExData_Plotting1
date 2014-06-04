#
# COURSERA
# Exploratory Data Analysis
# June 4th, 2013
# Peer Assessments / Course Project 1
#

# Load library for working with Data Tables
library(data.table)

# Histogram Global Active Power
plot1 <- function(){
    
    # Reading data from file (located in the working directory
    myTable <- read.table(file="./household_power_consumption.txt",
                          header = TRUE, sep=";", na.strings ="?",
                          colClasses = c(rep("character", 2),
                                         rep("numeric", 7)))
    
    # Convert to a Data Table. Select only rows "1/2/2007" and "2/2/2007"                     
    myDT <- data.table(myTable[myTable$Date == "1/2/2007" | myTable$Date == "2/2/2007",])

 
    # Plot 1
    par(mfrow = c(1,1), mar = c(5.1,5.1,4.1,2.1))
    
    hist(myDT$Global_active_power, col="red",
         xlab= "Global Active Power (kilowatts)", 
         main = "Global Active Power", );
    
    # Copy to PNG
    dev.copy(png,file="plot1.png", pointsize=8)
    dev.off()    
}
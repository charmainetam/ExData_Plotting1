#Set working directory
setwd("C:\\Users\\ctam0304.MCS\\Desktop\\datasciencecoursera\\4.ExploratoryDataAnalysis\\exdata-data-household_power_consumption")

#Read in txt file
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)

#Make Date column a date
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

#Subset data to only between 2007-02-01 and 2007-02-02 dates
subset_data <- data[data$Date >= "2007/02/01" & data$Date <= "2007/02/02", ]

#Make a new column merging Date and Time and change to date format
subset_data$DateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time),
                                   format="%Y-%m-%d %H:%M:%S")

#Change "Voltage", "Global_reactive_power" and "Submetering_1 and 2"  variables from factor to numeric
subset_data$Voltage <- as.numeric(as.character(subset_data$Voltage))
subset_data$Global_reactive_power <- as.numeric(as.character(subset_data$Global_reactive_power))
subset_data$Sub_metering_1 <- as.numeric(as.character(subset_data$Sub_metering_1))
subset_data$Sub_metering_2 <- as.numeric(as.character(subset_data$Sub_metering_2))

#PLOT 4
#Code for making graph and extracting it to PNG file
#Make png file
png(filename = "plot4.png",
    width = 480, height = 480) 

#Set up margins and 2x2 graph layout
par(mar=c(4,4,2,2),mfrow=c(2,2))

#Code for Plot 4
with(subset_data, {
  
  plot(DateTime, Global_active_power,
       type="l",
       xlab="",
       ylab = "Global Active Power",
       col="black")
  
  plot(DateTime,Voltage,
       type="l",
       xlab="datetime") 
       
  
  plot(DateTime,Sub_metering_1,type="l",col="black",
       xlab="",
       ylab="Energy sub metering",yaxp  = c(0, 30, 3))
  lines(DateTime,Sub_metering_2, type="l", col="red") 
  lines(DateTime,Sub_metering_3, type="l", col="blue")
  legend("topright",lty=c(1,1,1), cex=0.8,col= c("black","red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime,Global_reactive_power,
       type="l",
       xlab="datetime")
  
})

dev.off()


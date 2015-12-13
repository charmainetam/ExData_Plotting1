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

#Change Sub_metering_1 and 2 variables from factor to numeric
subset_data$Sub_metering_1 <- as.numeric(as.character(subset_data$Sub_metering_1))
subset_data$Sub_metering_2 <- as.numeric(as.character(subset_data$Sub_metering_2))

#PLOT 3
#Modify the page margins
par(mar=c(2,4,2,2),mfrow=c(1,1))

plot(subset_data$DateTime,subset_data$Sub_metering_1,type="l",col="black",
     ylab="Energy sub metering",xlab="",yaxp  = c(0, 30, 3))
lines(subset_data$DateTime,subset_data$Sub_metering_2, type="l", col="red") 
lines(subset_data$DateTime,subset_data$Sub_metering_3, type="l", col="blue")

#Add legend
legend("topright",lty=c(1,1,1), col= c("black","red", "blue"), cex=0.8, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Code for extracting Plot 3 to PNG file
png(filename = "plot3.png",
    width = 480, height = 480)  
plot(subset_data$DateTime,subset_data$Sub_metering_1,type="l",col="black",
     ylab="Energy sub metering",xlab="",yaxp  = c(0, 30, 3))
lines(subset_data$DateTime,subset_data$Sub_metering_2, type="l", col="red") 
lines(subset_data$DateTime,subset_data$Sub_metering_3, type="l", col="blue")
legend("topright",lty=c(1,1,1), col= c("black","red", "blue"), cex=0.8, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 





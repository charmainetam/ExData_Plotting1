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

#PLOT 1
#Change Global_active_power variable to numeric
subset_data$Global_active_power <- as.numeric(levels(subset_data$Global_active_power))[subset_data$Global_active_power]

#Modify the page margins
par(mar=c(4,4,2,2),mfrow=c(1,1))

#Graph for Plot 1
plot1 <- hist(subset_data$Global_active_power,
     main= paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)",
     col="red")

#Code for extracting Plot 1 to PNG file
png(filename = "plot1.png",
    width = 480, height = 480)  
hist(subset_data$Global_active_power,
     main= paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)",
     col="red")
dev.off()



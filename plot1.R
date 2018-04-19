### Exploratory Data Analysis Week 1 Project
### Plot1 reads househol_power_consumtion.txt creates a histogram based on a designated
### subset of the table. It is assumed that you have downloaded the file to your computer.

### Data file can be downloaded at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

### Set the working directory in RStudio or un-comment this setwd line and enter your own
### working directory path.
#setwd("C:/Users/kbobbit/Desktop/Data Science Course/4 Exploratory Data Analysis/1 Week 1/Project")

### Read full data file and subset to dates 2/1/2007 and 2/2/2007 as data_project. Remove full data set object.
data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
data_project <- subset(data_full, (data_full$Date == "2/1/2007") | (data_full$Date == "2/2/2007"))
rm(data_full)

### Open png device and set resolution, create histogram and turn off png device.
png(file = "plot1.png", width = 480, height = 480)

hist(data_project$Global_active_power,  col = "red", main = "Global Active Power\n2/1/07 to 2/2/07",
   xlab = "Global Active Power (kilowatts)")

dev.off()
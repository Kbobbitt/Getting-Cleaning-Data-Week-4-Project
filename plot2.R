### Exploratory Data Analysis Week 1 Project
### Plot2 reads household_power_consumtion.txt creates a plot based on a designated
### subset of the table.

### Data file can be downloaded at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

### Set the working directory in RStudio or un-comment this setwd line and enter your own
### working directory path.
#setwd("C:/Users/kbobbit/Desktop/Data Science Course/4 Exploratory Data Analysis/1 Week 1/Project")

### Read full data file and subset to dates 2/1/2007 and 2/2/2007 as data_project. Remove full data set object.
data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
data_project <- subset(data_full, (data_full$Date == "2/1/2007") | (data_full$Date == "2/2/2007"))
rm(data_full)

### Combine Date & Time fields then convert from character POSIX. Add to dataframe.
for(counter in 1:nrow(data_project)){
  if(counter==1){
    Date_Time <- paste(data_project$Date[counter], data_project$Time[counter])
  }
  else{Date_Time <- rbind(Date_Time, paste(data_project$Date[counter], data_project$Time[counter]))}
}
Date_Time <- strptime(Date_Time, "%m/%d/%Y %H:%M:%S")
data_project <- cbind(data_project, Date_Time)

### Open png device and set resolution, create plot and turn off png device.
png(file = "plot2.png", width = 480, height = 480)

with(data_project, plot(Global_active_power ~ Date_Time , type="l", ylab = "Global Active Power (kilowatts)", xlab=""))

dev.off()
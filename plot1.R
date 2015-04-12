#read the data
thedata <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))

#create the device object
png(file = "plot1.png")

#subset to get only data where value for Date is either 1/2/2007 or 2/2/2007
dataToUse <- subset(thedata, Date=="1/2/2007" | Date=="2/2/2007")

#convert character representation of the date to objects of class "Date"
dataToUse <- transform(dataToUse, Date=as.Date(Date,"%d/%m/%Y"))

#created the histogram
hist(dataToUse$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#surround graph with box
box()

#remove the device
dev.off()
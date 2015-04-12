#read in the data
thedata <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))

#create the device object
png(file = "plot2.png")

#subset to get only data where value for Date is either 1/2/2007 or 2/2/2007
dataToUse <- subset(thedata, Date=="1/2/2007" | Date=="2/2/2007")

#convert character representation of the date to objects of class "Date"
dataToUse <- transform(dataToUse, Date=as.Date(Date,"%d/%m/%Y"))

#dataToUse <- transform(dataToUse, Day=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")[as.POSIXlt(Date)$wday + 1])

#draw graph without axes
plot(dataToUse$Global_active_power, axes=F, typ='l', ann=T,ylab="Global Active Power (kilowatts)",xlab="")

#let R draw the Y axis
axis(2)

#draw the x axis
axis(1,at=c(0,1440,2880),labels=c("Thur","Fri","Sat"),tick=TRUE)

#surround graph with box
box()
#remove the device
dev.off()
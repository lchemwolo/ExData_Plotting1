#read in the data
thedata <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))

#create the device object
png(file = "plot4.png")

#subset to get only data where value for Date is either 1/2/2007 or 2/2/2007
dataToUse <- subset(thedata, Date=="1/2/2007" | Date=="2/2/2007")

#convert character representation of the date to objects of class "Date"
dataToUse <- transform(dataToUse, Date=as.Date(Date,"%d/%m/%Y"))

#dataToUse <- transform(dataToUse, Day=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")[as.POSIXlt(Date)$wday + 1])

par(mfrow=c(2,2),mar=c(4,4,2,1))
#draw graphs
with (dataToUse,{
  #Draw first graph
  plot(Global_active_power, axes=F, typ='l', ann=T,ylab="Global Active Power",xlab="")
  
  #let R draw the Y axis
  axis(2)
  
  #draw the x axis
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),tick=TRUE)
  
  #surround graph with box
  box()
  
  #Draw second graph
  plot(Voltage, axes=F, typ='l', ann=T,ylab="Voltage",xlab="datetime")
  
  #let R draw the Y axis
  axis(2)
  
  #draw the x axis
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),tick=TRUE)
  
  #surround graph with box
  box()
  
  #Draw third graph
  plot(Sub_metering_1, axes=F, typ='l', ann=T,ylab="Energy sub metering",xlab="",col="black")
  
  lines(Sub_metering_2,col="red")
  
  lines(Sub_metering_3,col="blue")
  
  #let R draw the Y axis
  axis(2)
  
  #draw the x axis
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),tick=TRUE)
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c("black","red","blue"))
  box()
  
  #Draw fourth graph
  plot(Global_reactive_power, axes=F, typ='l', ann=T,ylab="Global_reactive_power",xlab="datetime")
  
  #let R draw the Y axis
  axis(2)
  
  #draw the x axis
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),tick=TRUE)
  
  #surround graph with box
  box()
  
  
  })

dev.off()
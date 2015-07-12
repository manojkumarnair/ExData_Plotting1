
# Setting the file name 
  filename <- "household_power_consumption.txt"

# Read the full dataset
  mydatafile <- read.table(filename,header=TRUE,sep=";", na.strings="?")
  mydatafile$Date <- as.Date(mydatafile$Date, format="%d/%m/%Y")

#Get the subset of data for the required time period
  newdata<-subset(mydatafile,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(mydatafile)


#concatenating data & time
  mytime<- paste(newdata$Date,newdata$Time, sep=" ")
  myntime <- as.POSIXct(mytime)

#Plot the line graph & save to file
  png("plot3.png",width=480,height=480)
  plot(myntime,newdata$Sub_metering_1,type="l",xlab="time",ylab="Energy sub metering", main="Plot 3")
  lines(myntime,newdata$Sub_metering_2, col="RED")
  lines(myntime,newdata$Sub_metering_3, col="Blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()




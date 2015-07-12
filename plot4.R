
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
   
# Setting the data type of the variable
     globactpow<-as.numeric(newdata$Global_active_power)
     voltage <- as.numeric(newdata$Voltage)
     reactivepow<- as.numeric(newdata$Global_reactive_power)

#Plot the graphs in the four quadrants & save to file
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  

 # First quadrant line graph
    plot(myntime, globactpow, type="l", main="", xlab="Time",ylab="Global active Power(kilowatts)")

# Fourth quadrant line graph
    plot(myntime, voltage, type="l", main="", xlab="Time",ylab="Volatage")

# Second quadrant line graph
    plot(myntime,newdata$Sub_metering_1,type="l",xlab="time",ylab="Energy sub metering")
    lines(myntime,newdata$Sub_metering_2, col="RED")
    lines(myntime,newdata$Sub_metering_3, col="Blue")
    legend("topright", col=c("black", "red", "blue"), lty=, lwd=1, bty="o",
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Third quadrant line graph
     plot(myntime, reactivepow, type="l", main="", xlab="Time",ylab="Global_reactive_power")
     
     dev.copy(png, file="plot4.png", height=580, width=680)
     dev.off()




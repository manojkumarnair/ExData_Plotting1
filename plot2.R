# Setting the file name 
filename <- "household_power_consumption.txt"

# Read the full dataset
mydatafile <- read.table(filename,header=TRUE,sep=";", na.strings="?")
mydatafile$Date <- as.Date(mydatafile$Date, format="%d/%m/%Y")

#Get the subset of data for the required time period
newdata<-subset(mydatafile,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydatafile)

globactpow<-as.numeric(newdata$Global_active_power)

#concatenating data & time
mytime<- paste(newdata$Date,newdata$Time, sep=" ")
myntime <- as.POSIXct(mytime)

#Plot the line graph & save to file
png("plot2.png",width=480,height=480)
plot(myntime, globactpow, type="l", main=" Plot 2", xlab=" ",ylab="Global active Power(kilowatts)")
dev.off()




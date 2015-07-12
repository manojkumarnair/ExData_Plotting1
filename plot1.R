# Setting the file name 
filename <- "household_power_consumption.txt"

# Read the full dataset
mydatafile <- read.table(filename,header=TRUE,sep=";", na.strings="?")
mydatafile$Date <- as.Date(mydatafile$Date, format="%d/%m/%Y")

#Get the subset of data for the required time period
newdata<-subset(mydatafile,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert the data to required format 
globactpow<-as.numeric(newdata$Global_active_power)

#Plot the histogram & save to file
png("plot1.png",width=480,height=480)
hist(globactpow,main="Global active power", col="Red",xlab="Global active power(kilowats)", ylab="Frequency")
dev.off()
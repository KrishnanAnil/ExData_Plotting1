##Load data from the file
##Note : File must be in the working directory

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

##Filter out data from the dates 2007-02-01 and 2007-02-02

hpc<-  household_power_consumption[household_power_consumption$Date=="2/2/2007" | household_power_consumption$Date=="1/2/2007",]

##Make a new column DateTime with Date Time fileds combined as Date class
x <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

##Convert to the numeric fields 
hpc[,3:9] <- apply(hpc[,3:9], 2, function(x) as.numeric(as.character(x)))

##Create and save plot
png("plot1.png",width=480,height=480)
with(hpc,hist(Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency",warn.unused=F,main="Global Active Power"))
dev.off()


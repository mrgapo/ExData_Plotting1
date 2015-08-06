getData <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  data$DateTime <- as.POSIXct(strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S"));
  
  return(data);
}

#to write dates in right locale
Sys.setlocale(category = "LC_TIME", locale="us")

tmp <- getData();

png(filename = "figure/plot3.png", width = 480, height = 480)
plot(tmp$DateTime, tmp$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
points(tmp$DateTime, tmp$Sub_metering_2, col="red", type = 'l')
points(tmp$DateTime, tmp$Sub_metering_3, col="blue", type = 'l')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,col=c("black","red", "blue"))
dev.off();

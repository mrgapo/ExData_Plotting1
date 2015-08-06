getData <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  data$DateTime <- as.POSIXct(strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S"));
  
  return(data);
}

#to write dates in right locale
Sys.setlocale(category = "LC_TIME", locale="us")

tmp <- getData();

png(filename = "figure/plot2.png", width = 480, height = 480)
plot(tmp$DateTime, tmp$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off();

getData <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");
  data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  data$DateTime <- as.POSIXct(strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S"));
  
  return(data);
}

tmp <- getData();

png(filename = "figure/plot1.png", width = 480, height = 480)
  hist(tmp$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off();



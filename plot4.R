library(dplyr)

# Read Data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Filter Data
filtered_data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$date_time <- strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S")

# Export to PNG
png("plot4.png", width=480, height=480)

# Combining Plots
par(mfcol=c(2,2))

# Top Left
plot(filtered_data$date_time, filtered_data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# Bottom Left
plot(filtered_data$date_time, filtered_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(filtered_data$date_time, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$date_time, filtered_data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Top Right
plot(filtered_data$date_time, filtered_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Bottom Right
plot (filtered_data$date_time, filtered_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Shut off graphics device
dev.off()
library(dplyr)

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Filter data
filtered_data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$date_time <- strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S")

# Export to PNG
png("plot3.png", width=480, height=480)

# Plot graph
plot(filtered_data$date_time, filtered_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(filtered_data$date_time, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$date_time, filtered_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Shut off graphics device
dev.off()
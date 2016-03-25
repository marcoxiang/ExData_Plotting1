library(dplyr)

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Filter data
filtered_data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$date_time <- strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S")

# Export to PNG
png("plot2.png", width=480, height=480)

# Plot graph
plot(filtered_data$date_time, filtered_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Shut off graphics device
dev.off()
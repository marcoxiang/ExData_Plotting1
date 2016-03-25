library(dplyr)

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# Filter data by a 2 day period in February 2007
filtered_data <- filter(data, Date %in% c("1/2/2007","2/2/2007")) 

# Export to PNG 480x480
png("plot1.png", width=480, height=480)

# Plot graph
hist(filtered_data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

# Shut off graphics device
dev.off()
# Loading data.table library
library(data.table)

# Read data using some estimation
data <- fread(input = "household_power_consumption.txt", na.strings = "?", nrows = 4000, skip = 66240)

# Set the column names
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Subset data
data2 <- subset(data, data$Date == "1/2/2007")
data3 <- subset(data, data$Date == "2/2/2007")
data <- rbind(data2, data3)

# Convert the Date column to Date objects
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, format("%d/%m/%Y %H:%M:%S"))
data <- cbind(datetime, data)

# Plot into png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$datetime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

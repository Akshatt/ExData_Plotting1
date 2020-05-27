# loading required libraries
library(dplyr)

# loading data from .txt. file and filtering based on requirements
electric_data <- read.table("data/household_power_consumption.txt", TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
electric_data$Date <- as.Date(electric_data$Date, format = "%d/%m/%Y")
working_data <- filter(electric_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plotting the graph into plot1.png
png("plot1.png")
with(working_data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red"))
dev.off()
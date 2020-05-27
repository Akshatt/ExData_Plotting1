# loading required libraries
library(dplyr)

# loading data from .txt. file and filtering based on requirements
electric_data <- read.table("data/household_power_consumption.txt", 
                            TRUE, 
                            sep=";", 
                            na.strings = "?", 
                            stringsAsFactors = FALSE
                        )
electric_data$Date <- as.Date(electric_data$Date, format = "%d/%m/%Y")
working_data <- filter(electric_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# delete variable electric_data and changing classes of Date and Time
rm(electric_data)
temp_time <- paste(working_data$Date, working_data$Time)
working_data$Time <- strptime(temp_time, format="%Y-%m-%d %H:%M:%S") 

# plotting into plot2.png
png("plot2.png") #default height and width are 480 pixels so no need to pass them as arguments. 
with(working_data, plot(x=Time, y= Global_active_power, 
                        type="l", 
                        xlab="",
                        ylab="Global Active Power (kilowatts)"
                    )
     )
dev.off()
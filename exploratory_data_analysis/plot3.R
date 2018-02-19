## plot3.R
## Exploratory Data Analysis- Project 1- Part 3

## plot3
##
## Reads "household_power_consumption.txt" for 1 Feb 2007 - 2 Feb 2007 and plots
## the Energy Sub Metering (1, 2, 3) vs time, saving it to a png file.
plot3 <- function() {
        ## Load sqldf library
        if(!require(sqldf)) install.package(sqldf)
        require(sqldf)
        
        ## Set data input filename
        fileName <- "household_power_consumption.txt"
        
        ## Set SQL select query
        ## Note that input file has date formatted as d/m/y
        my_sql <- paste(' SELECT', 
                        '   Date', 
                        ' , Time', 
                        ' , Sub_metering_1', 
                        ' , Sub_metering_2', 
                        ' , Sub_metering_3', 
                        ' FROM', 
                        '   file', 
                        ' WHERE',
                        '   (Date = "1/2/2007" OR Date = "2/2/2007")'
        )
        
        ## Read data using SQL query
        my_data <- read.csv.sql(fileName, sep=";", sql = my_sql)
        
        ## Add datetime column
        my_data$dt <- strptime(paste(my_data$Date, my_data$Time), 
                               "%d/%m/%Y %H:%M:%S")
        
        ## Open output device as png file
        png("ExData_Plotting1/plot3.png")
        
        ## Plot data
        plot(my_data$dt,
             my_data$Sub_metering_1,
             main = "",
             xlab = "",
             ylab = "Energy sub metering",
             ylim = c(0, 40),
             yaxp = c(0, 30, 3),
             type = "l")
        
        points(my_data$dt,
               my_data$Sub_metering_2,
               type = "l",
               col = "red")
        
        points(my_data$dt,
               my_data$Sub_metering_3,
               type = "l",
               col = "blue")
        
        legend("topright",
               lty = 1,
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## Close output device
        dev.off()
}
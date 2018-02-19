## plot4.R
## Exploratory Data Analysis- Project 1- Part 4

## plot4
##
## Reads "household_power_consumption.txt" for 1 Feb 2007 - 2 Feb 2007 and plots
## several parameters vs time in a matrix of four, saving it to a png file.
plot4 <- function() {
        ## Load sqldf library
        if(!require(sqldf)) install.package(sqldf)
        require(sqldf)
        
        ## Set data input filename
        fileName <- "household_power_consumption.txt"
        
        ## Set SQL select query
        ## Note that input file has date formatted as d/m/y
        my_sql <- paste(' SELECT', 
                        '   *', 
                        ' FROM', 
                        '   file', 
                        ' WHERE',
                        '   (Date = "1/2/2007" OR Date = "2/2/2007")')
        
        ## Read data using SQL query
        my_data <- read.csv.sql(fileName, sep=";", sql = my_sql)
        
        ## Add datetime column
        my_data$dt <- strptime(paste(my_data$Date, my_data$Time), 
                               "%d/%m/%Y %H:%M:%S")
        
        ## Open output device as png file
        png("ExData_Plotting1/plot4.png")
        
        par(mfrow = c(2, 2))
        
        plot_1(my_data)
        
        plot_2(my_data)
        
        plot_3(my_data)
        
        plot_4(my_data)
        
        ## Close output device
        dev.off()
}

plot_1 <- function(df) {
        ## Plot data
        plot(df$dt,
             df$Global_active_power,
             main = "",
             xlab = "",
             ylab = "Global Active Power",
             ylim = c(0, 8),
             yaxp = c(0, 6, 3),
             type = "l")
        
}

plot_2 <- function(df) {
        ## Plot data
        plot(df$dt,
             df$Voltage,
             main = "",
             xlab = "datetime",
             ylab = "Voltage",
             ylim = c(233, 247),
             yaxp = c(234, 246, 6),
             type = "l")
        
}

plot_3 <- function(df) {
        ## Plot data
        plot(df$dt,
             df$Sub_metering_1,
             main = "",
             xlab = "",
             ylab = "Energy sub metering",
             ylim = c(0, 40),
             yaxp = c(0, 30, 3),
             type = "l")
        
        points(df$dt,
               df$Sub_metering_2,
               type = "l",
               col = "red")
        
        points(df$dt,
               df$Sub_metering_3,
               type = "l",
               col = "blue")
        
        legend("topright",
               lty = 1,
               bty = "n",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot_4 <- function(df) {
        ## Plot data
        plot(df$dt,
             df$Global_reactive_power,
             main = "",
             xlab = "datetime",
             ylab = "Global_reactive_power",
             ylim = c(0, 0.5),
             type = "l")
        
}
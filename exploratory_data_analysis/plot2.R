## plot2.R
## Exploratory Data Analysis- Project 1- Part 2

## plot2
##
## Reads "household_power_consumption.txt" for 1 Feb 2007 - 2 Feb 2007 and plots
## the Global Active Power vs time, saving it to a png file.
plot2 <- function() {
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
                        ' , Global_active_power', 
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
        png("ExData_Plotting1/plot2.png")
        
        ## Plot data
        plot(my_data$dt,
             my_data$Global_active_power,
             main = "",
             xlab = "",
             ylab = "Global Active Power (kilowatts)",
             ylim = c(0, 7.5),
             yaxp = c(0, 6, 3),
             type = "l")
        
        ## Close output device
        dev.off()
}
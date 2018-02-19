## plot1.R
## Exploratory Data Analysis- Project 1- Part 1

## plot1
##
## Reads "household_power_consumption.txt" for 1 Feb 2007 - 2 Feb 2007 and plots
## a frequency histogram of Global Active Power, saving it to a png file.
plot1 <- function() {
        ## Load sqldf library
        if(!require(sqldf)) install.package(sqldf)
        require(sqldf)
        
        ## Set data input filename
        fileName <- "household_power_consumption.txt"
        
        ## Set SQL select query
        ## Note that input file has date formatted as d/m/y
        my_sql <- paste(' SELECT', 
                        '   Global_active_power', 
                        ' FROM', 
                        '   file', 
                        ' WHERE',
                        '   (Date = "1/2/2007" OR Date = "2/2/2007")'
        )
        
        ## Read data using SQL query
        my_data <- read.csv.sql(fileName, sep=";", sql = my_sql)
        
        ## Open output device as png file
        png("ExData_Plotting1/plot1.png")
        
        ## Plot histogram
        hist(my_data$Global_active_power,
             freq = TRUE,
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             xlim = c(0, 8),
             ylim = c(0, 1200),
             xaxp = c(0, 6, 3),
             col = "red")
        
        ## Close output device
        dev.off()
}
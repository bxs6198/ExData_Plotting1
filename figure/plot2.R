##
##  plot2.R
##

##
##  STEP 1: Prepare the data for plotting.
##

    ## Source the 'prepareData.R' script to perform the following:
    ##
    ##  1) Download the original data file from the Internet
    ##  2) Uncompress the data file
    ##  3) Read the data into the RStudio environment
    ##  4) Process the date fields into a usable formate
    ##  5) Generates a data frame called 'data' for plotting
    ##
    ##  The data frame 'data' has the following structure:
    ##    > str(data)
    ##    'data.frame':    2880 obs. of  8 variables:
    ##     $ DateTime             : POSIXlt, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" ...
    ##     $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
    ##     $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
    ##     $ Voltage              : num  243 243 244 244 243 ...
    ##     $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
    ##     $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
    ##     $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
    ##     $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
    ##
    source("prepareData.R")
    
    ## The following descriptions are of the 8 variables in data frame 'data'.
    ##   DateTime: POSIX Date and time in format yyyy-mm-dd hh:mm:ss format
    ##   Global_active_power: household global minute-averaged active power
    ##                        (in kilowatt)
    ##   Global_reactive_power: household global minute-averaged reactive power
    ##                          (in kilowatt)
    ##   Voltage: minute-averaged voltage (in volt)
    ##   Global_intensity: household global minute-averaged current intensity
    ##                     (in ampere)
    ##   Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active
    ##                   energy).
    ##                   It corresponds to the kitchen, containing mainly a
    ##                   dishwasher, an oven and a microwave (hot plates are
    ##                   not electric but gas powered).
    ##   Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active
    ##                   energy).
    ##                   It corresponds to the laundry room, containing a
    ##                   washing-machine, a tumble-drier, a refrigerator and
    ##                   a light.
    ##   Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active
    ##                   energy).
    ##                   It corresponds to an electric water-heater and an
    ##                   air-conditioner.
    
##
##  STEP 2: Plot to the screen.
##    

    ## Generate the plot
    plot(data$Global_active_power ~ as.POSIXct(data$DateTime),
         type="l",
         ylab="Global Active Power (kilowatts)",
         xlab="")
    
##
##  STEP 3: Plot to the PNG device.
##
    
    ## Open the PNG device
    png(filename="plot2.png",
        width=480,
        height=480)
    
    ## Generate the plot
    plot(data$Global_active_power ~ as.POSIXct(data$DateTime),
         type="l",
         ylab="Global Active Power (kilowatts)",
         xlab="")
    
    ## Close the PNG device
    dev.off()
    
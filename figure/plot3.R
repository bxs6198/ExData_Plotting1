##
##  plot3.R
##

##
##  STEP 1: Prepare the data for plotting.
##

    ## Source the prepareData.R file in the current working directory.
    ##  The data frame 'data' contains the data required for the plot.
    source("prepareData.R")
    
    ## The following descriptions are of the 8 variables in 'data'.
    ##  DateTime: POSIX Date and time in format yyyy-mm-dd hh:mm:ss format
    ##  Global_active_power: household global minute-averaged active power
    ##                       (in kilowatt)
    ##  Global_reactive_power: household global minute-averaged reactive power
    ##                         (in kilowatt)
    ##  Voltage: minute-averaged voltage (in volt)
    ##  Global_intensity: household global minute-averaged current intensity
    ##                    (in ampere)
    ##  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active
    ##                  energy).
    ##                  It corresponds to the kitchen, containing mainly a
    ##                  dishwasher, an oven and a microwave (hot plates are
    ##                  not electric but gas powered).
    ##  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active
    ##                  energy).
    ##                  It corresponds to the laundry room, containing a
    ##                  washing-machine, a tumble-drier, a refrigerator and
    ##                  a light.
    ##  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active
    ##                  energy).
    ##                  It corresponds to an electric water-heater and an
    ##                  air-conditioner.
    
    
##
##  STEP 2: Plot to the screen.
##
    ## Generate the plot
    
##
##  STEP 3: Plot to the PNG device.
##
    
    ## Open the PNG device
    png(filename="plot3.png",
        width=480,
        height=480)
    
    ## Generate the plot
    
    ## Close the PNG device
    dev.off()
    
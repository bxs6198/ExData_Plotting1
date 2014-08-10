##
## prepareData.R
##
##  Load the data in preparation for the plots.
##

##
##  STEP 1: Set the RStudio and directory environment configuration
##

    ## Load the 'zoo' library for date/time processing
    library("zoo")

    ## Check for the './data' directory and if it doesn't exist create it as
    ## this is where the data file will be downloaded and stored.
    if (!file.exists("./data")) {dir.create("./data")}

##
##  STEP 2: Download the source .zip data file into the current working
##          directory.  Unzip the file and read the raw data file into the
##          RStudio environment.
##

    ## Source data file URL (taken from project instructions).
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    ## Local Zip file name for the 'Individual Household Electric Power
    ## Consumption Dataset'.
    zipfile <- "./data/exdata-data-household_power_consumption.zip"
    
    ## Local data file name for the 'Individual Household Electric Power
    ## Consumption Dataset'.
    datafile <- "./data/household_power_consumption.txt"
    
    ## If the .zip data file does not exist, then download the source .zip data
    ## file for the 'Individual Household Electric Power Consumption Dataset'.
    if (!file.exists(zipfile)) {
        ## Download the .zip data file.
        download.file(url=fileURL,
                      destfile=zipfile,
                      quiet=TRUE)
        ## Record the date the file was downloaded.
        dateDownloaded <- date()
    }       
    
    ## If the .txt data file does not exist, then unzip the .zip data file for
    ## the 'Individual Household Electric Power Consumption Dataset'.
    if (!file.exists(datafile)) {
        unzip(zipfile,
              overwrite=TRUE,
              exdir="./data")
    }
    
    ## The following descriptions are of the 9 variables in the dataset:
    ##
    ##  Date: Date in format dd/mm/yyyy
    ##  Time: time in format hh:mm:ss
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
    
    ## Define the column classes to be read.
    readcols <- c("character",
                  "character",
                  "numeric",
                  "numeric",
                  "numeric",
                  "numeric",
                  "numeric",
                  "numeric",
                  "numeric")
        
    ## Read in the data file.
    ##   The data records for 2007-02-01 through 2007-02-02 are located in
    ##   rows 66638 through 69518 of the data file.  This will subset the
    ##   data at the outset.
    data <- read.table(datafile,
                       header=FALSE,
                       sep=";",
                       na.strings="?",
                       colClasses=readcols,
                       skip=66637,
                       nrows=2880,
                       comment.char="",
                       stringsAsFactors=FALSE)
    
    ## Merge the date and time and convert them to a POSIXlt class
    data$V1 <- strptime(paste(data$V1,data$V2),
                        "%d/%m/%Y %H:%M:%S")

    ## Drop the V2 column (the 'Time' column from the original data file).
    data <- data[,c(1,3:9)]
    
    ## Define the names of the columns for the data.
    colnames <- c("DateTime",
                  "Global_active_power",
                  "Global_reactive_power",
                  "Voltage",
                  "Global_intensity",
                  "Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3")    
    
    ## Apply the names to the data frame.
    names(data) <- colnames
    
##
##  At this point, the data frame 'data' contains the data required for
##  each of the plots.
##
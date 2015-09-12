#--------|10-------|20-------|30-------|40-------|50-------|60-------|70-------|80

#---------------------------#==  \\      \\
#     ___ plot1.R ___       #==  |`\\___.\\\
# Sarah Michel-2015-09-10   #==  ##  ;@._ `@.
# Course Project #1         #==  \#  ,     & \ 
# Exploratory Data Analysis #===  #_/ ``\/\/\/  AA
# Coursera                  #===  /#`-.____/   /%/>
#---------------------------#==  /##/      |  ///

# Go to correct working directory which contains household_power_consumption.txt
    # setwd ("YOUR_DIRECTORY_HERE/ExData_Plotting1")

# Read in just the data we want
    dat <- read.table(
        pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
        ,sep=";"
        ,na.strings="?")

# Apply the headers
    names(dat) <- c(t(
        read.table("household_power_consumption.txt",sep=";",nrows=1)))

# Create Plot 1 (red histogram) to .png
    png(filename = "plot1.png",width=480,height=480,bg="transparent")
        hist(dat$Global_active_power
             ,col="red"
             ,main="Global Active Power"
             ,xlab="Global Active Power (kilowatts)")
    dev.off()
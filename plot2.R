#--------|10-------|20-------|30-------|40-------|50-------|60-------|70-------|80

#---------------------------#==  \\      \\
#     ___ plot2.R ___       #==  |`\\___.\\\
# Sarah Michel-2015-09-10   #==  ##  ;@._ `@.
# Course Project #1         #==  \#  ,     & \ 
# Exploratory Data Analysis #===  #_/ ``\/\/\/  AA
# Coursera                  #===  /#`-.____/   /%/>
#---------------------------#==  /##/      |  ///

# Go to correct working directory which contains household_power_consumption.txt
    # setwd ("YOUR_DIRECTORY_HERE")

# Read in just the data we want
    dat <- read.table(
        pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
        ,sep=";"
        ,na.strings="?")

# Apply the headers
    names(dat) <- c(t(
        read.table("household_power_consumption.txt",sep=";",nrows=1)))

# Wrangle the given date and time strings into a more useful date form
    dat$DateTime <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")
    dat <- dat[,c(10,3:9)]

# Create Plot 2 (global active power by day) to .png
    png(filename = "plot2.png",width=480,height=480,bg="transparent")
        plot(dat$DateTime
             ,dat$Global_active_power
             ,type="l"
             ,xlab=""
             ,ylab="Global Active Power (kilowatts)")
    dev.off()
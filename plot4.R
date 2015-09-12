#--------|10-------|20-------|30-------|40-------|50-------|60-------|70-------|80

#---------------------------#==  \\      \\
#     ___ plot4.R ___       #==  |`\\___.\\\
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
    dat$DateTime <- strptime(
        paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")
    dat <- dat[,c(10,3:9)]

# Create Plot 4 (four-in-one chart) to .png
    png(filename = "plot4.png",width=480,height=480,bg="transparent")

        par(mfrow=c(2,2))
    
        #TopLeft Chart
        plot(dat$DateTime
            ,dat$Global_active_power
            ,type="l"
            ,xlab=""
            ,ylab="Global Active Power (kilowatts)")
        
        #TopRight Chart
        plot(dat$DateTime
             ,dat$Voltage
             ,type="l"
             ,xlab="datetime"
             ,ylab="Voltage")
        
        #BottomLeft Chart
        plot(dat$DateTime
             ,dat$Sub_metering_1
             ,xlab=""
             ,ylab="Energy sub metering"
             ,type="l"
             ,col="black") 
        
        points(dat$DateTime
               ,dat$Sub_metering_2
               ,type="l"
               ,col="red")
        
        points(dat$DateTime
               ,dat$Sub_metering_3
               ,type="l"
               ,col="blue")
        
        legend("topright"
               ,lwd=1
               ,lty=1
               ,col=c("black","red","blue")
               ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
               ,bty="n")
        
        #BottomRight Chart
        plot(dat$DateTime
             ,dat$Global_reactive_power
             ,type="l"
             ,xlab="datetime"
             ,ylab="Global_reactive_power")

    dev.off()
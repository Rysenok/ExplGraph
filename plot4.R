d<-read.csv('./household_power_consumption.txt',
            sep=';',stringsAsFactors = F)
d$Date<-as.Date(d$Date,'%d/%m/%Y')
l<-d$Date %in% as.Date(c('2007-02-01','2007-02-02'))
d<-d[l,]

d$Date2<-as.POSIXct(strptime(paste(d$Date, d$Time), '%Y-%m-%d %H:%M:%OS'))
range(d$Date2)

d[,c(3:9)]<-sapply(d[,3:9],as.numeric)
summary(d)

par(mfrow=c(2,2))

plot(d$Date2,d$Global_active_power,type='l',xlab='',ylab='Global Active Power')

plot(d$Date2,d$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(d$Date2,d$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(d$Date2,d$Sub_metering_2,col='red')
lines(d$Date2,d$Sub_metering_3,col='blue')
legend('topright',col=c('black','red','blue'),lty='solid',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       bty = 'n')

plot(d$Date2,d$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')


dev.copy(png,'./plot4.png',480,480)
dev.off()

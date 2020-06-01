d<-read.csv('./household_power_consumption.txt',
            sep=';',stringsAsFactors = F)
d$Date<-as.Date(d$Date,'%d/%m/%Y')
l<-d$Date %in% as.Date(c('2007-02-01','2007-02-02'))
d<-d[l,]

d$Date2<-as.POSIXct(strptime(paste(d$Date, d$Time), '%Y-%m-%d %H:%M:%OS'))
range(d$Date2)

d[,c(3:9)]<-sapply(d[,3:9],as.numeric)
summary(d)

hist(d$Global_active_power,col='red',xlab='Global Active Power (kilowats)',
     main='Global Active Power')
dev.copy(png,'./plot1.png',480,480)
dev.off()

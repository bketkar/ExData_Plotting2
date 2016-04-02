NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

#plot 1
par("mar"=c(5,4,2,2))
totalEmmisions<-aggregate(NEI$Emissions,list(NEI$year),FUN="sum")
png(filename="./plot/plot1.png",
    width=480, height=480,
    units="px")
plot(totalEmmisions,type="l",xlab="Year",
     main="Pollution in the United states over the 10-year period 1999–2008",
     ylab=expression('Total PM'[2.5]*" Emmission"))
dev.off()

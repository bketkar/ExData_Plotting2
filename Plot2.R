NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

baltimoredata <- NEI[which(NEI$fips == "24510"), ]
baltimoredata2 <- with(baltimoredata,aggregate(Emissions, by = list(year),sum))
colnames(baltimoredata2)<-c("year","Emmisions")
png(filename="./plot/plot2.png",
    width=480, height=480,
    units="px")
plot(baltimoredata2$year,baltimoredata2$Emissions, type = "b", pch = 25,col = "red",ylab="Emissions",xlab="Year",main="Baltimore Emissions")
dev.off()

library(ggplot2)
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename="./plot/plot3.png",
    width=480, height=480,
    units="px")
plotdata <- ggplot(NEI[NEI$fips == "24510", ], aes(year, Emissions, color = type))
plotdata + geom_line(stat="summary",fun.y="sum") +  ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()

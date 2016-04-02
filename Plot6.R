NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")
library(ggplot2)

requiredData <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]
motordata <- grep("motor", SCC$Short.Name, ignore.case = T)
motordata <- SCC[motordata, ]

motordata <- requiredData[requiredData$SCC %in% motordata$SCC, ]
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename="./plot/plot6.png",
    width = 480, height = 480,
    units = "px")

g <- ggplot(motordata, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  #ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

dev.off()

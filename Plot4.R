NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename="./plot/plot4.png",
    width = 480, height = 480,
    units = "px")
requiredData <- grep("coal", SCC$Short.Name, ignore.case = T)
coaldata <- SCC[requiredData,]
coaldata <- NEI[NEI$SCC %in% coaldata$SCC,]
coalEmissions <- aggregate(coaldata$Emissions, list(coaldata$year), FUN = "sum")
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()

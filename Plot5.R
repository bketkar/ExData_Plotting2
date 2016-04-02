NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename="./plot/plot5.png",
    width = 480, height = 480,
    units = "px")
requiredData <- grep("motor", SCC$Short.Name, ignore.case = T)
motorvehicledata <- SCC[requiredData,]
motorvehicledata <- NEI[NEI$SCC %in% motorvehicledata$SCC,]
motorEmissions <- aggregate(motorvehicledata$Emissions, list(motorvehicledata$year), FUN = "sum")
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From motorvehicle-related\n Sources from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()

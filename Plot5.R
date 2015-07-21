require(dplyr)
require(data.table)
require(ggplot2)

if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

if(!exists("SCC"))
        SCC <- readRDS("Source_Classification_Code.rds") 

plot5SCC <- SCC[grepl("Vehicles",SCC$EI.Sector, ignore.case=T ),]

plot5Data <- aggregate(Emissions ~ year, 
                       data = NEI[NEI$SCC %in% plot5SCC$SCC & NEI$fips=="24510",], 
                       FUN=sum)

p <- ggplot(data=plot5Data, aes(x=year, y=Emissions)) + 
        geom_line(colour = "red", size = 1) + 
        geom_point(size=3, shape=22, fill="white") +
        xlab("Year") + 
        ylab("Emissions in tons") + 
        ggtitle("Emissions from motor vehicle sources in Baltimore City")

print(p)
require(dplyr)
require(data.table)
require(ggplot2)

if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

if(!exists("SCC"))
        SCC <- readRDS("Source_Classification_Code.rds") 

if(!exists("plot4SCC"))
        plot4SCC <- SCC[grepl("Comb",SCC$EI.Sector, ignore.case=T ) & 
                                grepl("Coal",SCC$EI.Sector, ignore.case=T ),]

plot4Data <- aggregate(Emissions ~ year, data = NEI[NEI$SCC %in% plot4SCC$SCC,], FUN=sum)

p <- ggplot(data=plot4Data,aes(x=year, y=Emissions)) + 
        geom_line(colour = "red", size = 1) + 
        geom_point(size=3, shape=22, fill="white")

print(p)
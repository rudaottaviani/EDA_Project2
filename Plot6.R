require(dplyr)
require(data.table)
require(ggplot2)

if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

if(!exists("SCC"))
        SCC <- readRDS("Source_Classification_Code.rds") 

plot6SCC <- SCC[grepl("Vehicles", SCC$EI.Sector, ignore.case=T ),]

src6Data <- NEI[NEI$SCC %in% plot6SCC$SCC & (NEI$fips=="24510" | NEI$fips=="06037"), ]

plot6Data <- aggregate(Emissions ~ year + fips, 
                       data = src6Data, 
                       FUN=sum)

p <- ggplot(data=plot6Data, aes(x=year, y=Emissions, col=fips)) + 
        geom_line(csize = 1) + 
        geom_point(size=3, shape=22, fill="white") +
        labs(title="Emissions from motor vehicle sources in Los Angeles vs Baltimore City",
             x = "Year",
             y = "PM2.5 Emissions in tons") + 
        scale_color_manual(
                "City", 
                labels = c("Los Angeles", "Baltimore City"), 
                values = c("blue", "red"))


print(p)
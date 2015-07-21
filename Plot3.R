if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

plot3Data <- aggregate(
        Emissions ~ year + type, 
        data = NEI[NEI$fips=="24510",], 
        FUN=sum)

p <- ggplot(plot3Data, aes(x=year, y=Emissions, group=type, color=type)) + 
        geom_line(size=1) +
        geom_point(size=3, shape=22, fill="white") +
        xlab("Year") +
        ylab("Emissions in tons") + 
        ggtitle("Emissions in Baltimore City (tons)")

print(p)
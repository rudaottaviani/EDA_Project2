if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

if(!exists("plot2Data"))
        plot2Data <- aggregate(
                NEI[NEI$fips=="24510",]$Emissions, 
                by=list(year=NEI[NEI$fips=="24510",]$year), 
                FUN=sum)

barplot(
        plot2Data$x, 
        names.arg=plot2Data$year, 
        xlab="Year",
        ylab="PM2.5 (tons)",
        ylim=c(0, max(plot2Data$x) + 0.4 * max(plot2Data$x)))

legend("topright", 
       pch=15, 
       col="darkgray", 
       legend="PM2.5 emitted in Baltimore City (tons)")
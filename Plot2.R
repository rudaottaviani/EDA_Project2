if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

pData <- aggregate(
        NEI[NEI$fips=="24510",]$Emissions, 
        by=list(year=NEI[NEI$fips=="24510",]$year), 
        FUN=sum)

barplot(
        pData$x, 
        names.arg=pData$year, 
        ylim=c(0, max(pData$x) + 0.4 * max(pData$x)))
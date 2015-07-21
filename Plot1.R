if(!exists("NEI"))
        NEI <- readRDS("summarySCC_PM25.rds")

plot1Data <- aggregate(
        NEI$Emissions, 
        by=list(year=NEI$year), 
        FUN=function(x){ sum(x) / 1000000 })

barplot(
        plot1Data$x, 
        names.arg=plot1Data$year, 
        xlab="Year",
        ylab="PM2.5 (millon of tons)",
        ylim=c(0, max(plot1Data$x) + 0.2 * max(plot1Data$x)))

legend("topright", 
       pch=15, 
       col="darkgray", 
       legend="PM2.5 emitted, in million of tons")
##Subsetting the data.
NEI25balt<-subset(NEI25dat,fips=="24510")

##Aggregating the data for the plot.
NEI25baltagg<-aggregate(NEI25balt$`Emissions (Tons)`,by=list(NEI25balt$year), sum)

##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot2.png", width = 1000, height = 1000)

plot(NEI25baltagg,
     type="p",
     main="Total PM 2.5 Emissions in Baltimore 1999 - 2008",
     xlab="Year",
     ylab="Emissions (Tons)",
     pch=15,
     col="blue",
     xaxt = 'n')

axis(side = 1, at = c(1999,2002,2005,2008))


##OLS line.
line<-glm(NEI25baltagg$x~NEI25baltagg$Group.1)
abline(line)

dev.off()

##Total emissions of PM 2.5 have somewhat decreased in the Baltimore from 1999 to 2008, with 2005 showing a large spike.
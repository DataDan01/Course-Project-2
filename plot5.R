##For the sake of simplicity let's assume the ON-ROAD category captures motor vehicles.
NEI25baltauto<-subset(NEI25dat,fips=="24510" & type=="ON-ROAD")

NEI25baltautoagg<-aggregate(NEI25baltauto$`Emissions (Tons)`,by=list(NEI25baltauto$year), sum)

##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot5.png", width = 1000, height = 1000)

plot(NEI25baltautoagg,
     type="p",
     main="Total PM 2.5 Emissions in from Motor Vehicles in Baltimore 1999 - 2008",
     xlab="Year",
     ylab="Emissions (Tons)",
     pch=15,
     col="blue")

##OLS line.
line<-glm(NEI25baltautoagg$x~NEI25baltautoagg$Group.1)
abline(line)

dev.off()

##Emissions in Baltimore from motor vehicle sources have generally gone downn since 1999.
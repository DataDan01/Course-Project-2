##Let's look for the word "coal" in any of the columns that contain names/descriptions.
coalrows<-cbind(sapply(NEI25class[,3:10],grep,pattern="coal"),
            sapply(NEI25class[,3:10],grep,pattern="Coal"),
            sapply(NEI25class[,3:10],grep,pattern="/Coal"))
    
##Converting the data into a vector and removing all repeats.
coalrows <-unlist(coalrows)
coalrows <-unique(coalrows)

##Now let's do the same thing for "combustion".
combustionrows<-cbind(sapply(NEI25class[,3:10],grep,pattern="combustion"),
                sapply(NEI25class[,3:10],grep,pattern="Combustion"),
                sapply(NEI25class[,3:10],grep,pattern="/Combustion"))

##Converting the data into a vector and removing all repeats.
combustionrows <-unlist(combustionrows)
combustionrows <-unique(combustionrows)

##Extracting the rows which have anything to do with both coal and combustion.
intersectrows<-intersect(coalrows,combustionrows)

##Getting the SCC codes and then using that to subset NEI25dat.
NEI25class$SCC<-as.character(NEI25class$SCC)
SCCcodescoal<-NEI25class$SCC[intersectrows]

NEI25coalsub<-subset(NEI25dat,SCC==SCCcodescoal)

##Aggregating by year.
NEI25coalagg<-aggregate(NEI25coalsub$`Emissions (Tons)`,by=list(NEI25coalsub$year), sum)


##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot4.png", width = 1000, height = 1000)

plot(NEI25coalagg,
     type="p",
     main="Total PM 2.5 Emissions in from Coal Combustion 1999 - 2008",
     xlab="Year",
     ylab="Emissions (Tons)",
     pch=15,
     col="blue",
     xaxt = 'n')

axis(side = 1, at = c(1999,2002,2005,2008))

##OLS line.
line<-glm(NEI25coalagg$x~NEI25coalagg$Group.1)
abline(line)

dev.off()

##Generally it looks like emissions from coal combustion-related sources have decreased with 2002 being an outlier year.

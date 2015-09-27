##Subsetting for Baltimore and LA.
NEI25compare<-subset(NEI25dat,(fips=="24510" |fips=="06037") & type=="ON-ROAD")

##Changing the fips names to something easier.
NEI25compare[NEI25compare$fips=="24510",1]="Baltimore"
NEI25compare[NEI25compare$fips=="06037",1]="Los Angeles"


##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot6.png", width = 1000, height = 1000)

library(ggplot2)

ggplot(NEI25compare,aes(year,`Emissions (Tons)`,fill=fips))+
    geom_bar(stat="identity",alpha=0.8) +
    facet_grid(.~fips) +
    theme(legend.position="none") +
    labs(x="Year",title="Baltimore vs. Los Angeles PM 2.5 Emissions by Type") +
    scale_fill_manual(values=c("red","blue")) +
    scale_x_continuous(breaks=c(1999,2002,2005,2008))

dev.off()

##Baltimore's pollution levels have been decreasing while LA's levels have steadily climbed upwards and only started dropping off in 2008.
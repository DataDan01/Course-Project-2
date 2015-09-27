##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot3.png", width = 1000, height = 1000)

##Plotting by group in ggplot2.
library(ggplot2)

ggplot(NEI25balt,aes(year,`Emissions (Tons)`,fill=type))+
    geom_bar(stat="identity",alpha=0.8) +
    facet_grid(.~type) +
    theme(legend.position="none") +
    labs(x="Year",title="Baltimore PM 2.5 Emissions by Type") +
    scale_fill_manual(values=c("red","blue","green","brown")) +
    scale_x_continuous(breaks=c(1999,2002,2005,2008))
    
dev.off()

##NON-ROAD has decreased, NONPOINT has decreased, ON-ROAD has decreased, and POINT has increased and then dropped off.
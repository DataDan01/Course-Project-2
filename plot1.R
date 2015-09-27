##Download the data.
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              destfile="./NEI25.zip")
##Read in the zip files.
unzip(zipfile="./NEI25.zip")
NEI25dat<-readRDS(file="./summarySCC_PM25.rds")
NEI25class<-readRDS(file="./Source_Classification_Code.rds")

##Some tidying.
colnames(NEI25dat)[4]<-"Emissions (Tons)"

##Aggregating the data for the plot.
NEI25agg<-aggregate(NEI25dat$`Emissions (Tons)`,by=list(NEI25dat$year), sum)
NEI25agg$x<-NEI25agg$x/1000000

##Plotting + Exporting the plot to a 1000 x 1000 PNG
png(filename = "Plot1.png", width = 1000, height = 1000)

plot(NEI25agg,
     type="p",
     main="Total PM 2.5 Emissions 1999 - 2008",
     xlab="Year",
     ylab="Emissions (Millions of Tons)",
     pch=15,
     col="blue",
     xaxt = 'n')

axis(side = 1, at = c(1999,2002,2005,2008))

##OLS line.
line<-glm(NEI25agg$x~NEI25agg$Group.1)
abline(line)

dev.off()

##Total emissions of PM 2.5 have decreased in the United States from 1999 to 2008.
# Exploratory Data Analysis, COURSERA - Data Science Specialization - Exploratory Data Analysis - Project #2

#Defining the source of data and preparing data to the analysis
## defining url to the data source & downloading
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile<-"data.zip"
download.file(url=url, destfile=destfile)
## unpacking files
unzip(destfile)
## reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#installing and loading required package
install.packages("ggplot2")
library(ggplot2)

# plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008?

# gathering all necessary data - emissions in Batlimore City over the years 1999-2008 by type of its source
emissionsTBaltimore <- NEI[NEI$fips=="24510",]
emissionsTypeBaltimoreY <- aggregate(Emissions ~ year + type, emissionsTBaltimore, sum)

# making plot
png("plot3.png", height=500, width=700)
ggplot(emissionsTypeBaltimoreY, aes(x=factor(year), y=Emissions, fill=type)) +
        guides(fill=FALSE)+
        geom_bar(stat="identity") +
        facet_grid(. ~ type, scales="free", space="free") +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emission (in tonnes)")) +
        ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore City by source; period 1999 - 2008", sep="")))
dev.off()

#answer - Over the years 1999-2008 only emissions originating from POINT type of source increased (period 1999-2005), but over last 3 years significantly decreased.
#       Other sources of emissions showed a downward trend.
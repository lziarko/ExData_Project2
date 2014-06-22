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

# plot 2
# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from
# 1999 to 2008?

# gathering all necessary data - emissions in Batlimore City over the years 1999-2008
emissionsTBaltimore <- NEI[NEI$fips=="24510",]
emissionsTBaltimoreY <- aggregate(Emissions ~ year, emissionsTBaltimore, sum)

# making plot
png("plot2.png", height=500, width=700)
barplot(height=emissionsTBaltimoreY$Emissions,
        names.arg=emissionsTBaltimoreY$year,
        xlab="years", ylab=expression('total PM'[2]* 'emission (in tonnes)'),
        main=expression('Total PM'[2]*' emissions in Baltimore City; period 1999 - 2008'))
dev.off()
# answer -  Yes, total emmisions from PM2.3 in Baltimore City decreased over the perdiod 1999-2008 
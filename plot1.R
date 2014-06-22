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

# plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# gathering all necessary data - sum of the volume of the emmisions in given years
emissionsT <- aggregate(Emissions ~ year, NEI, sum)

# making plot
png("plot1.png", height=500, width=700)
barplot(height=emissionsT$Emissions, names.arg=emissionsT$year,
        xlab="years", ylab=expression('PM'[2]*' emission (in tonnes)'),
        main=expression('Total PM'[2]*' emissions; period 1999 - 2008'))
dev.off()

# answer - Yes, total emmisions from PM2.3 in the United States decreased over the perdiod 1999-2008
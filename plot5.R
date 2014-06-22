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

# plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# gathering all necessary data - emissions from motor vehicle sources in  Baltimore City
emissionsBaltimoreMVehicle <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
emissionsBaltimoreMVehicleY <- aggregate(Emissions ~ year, emissionsBaltimoreMVehicle, sum)

# making plot
png("plot5.png", height=500, width=700)
ggplot(emissionsBaltimoreMVehicleY, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity", fill="grey", colour="black", width=.5) +
        xlab("year") +
        ylab(expression("PM"[2.5]*" emissions (in tonnes)")) +
        ggtitle("Emissions from motor vehicle sources in Baltimore City, period 1999 - 2008")
dev.off()

# answer - emissions from motor vehicle in Baltimore City durig the years 1999 - 2005 decreased almost 4 times from 346.82 tones/year to 88.28 tones/year
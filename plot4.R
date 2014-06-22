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

# plot 4
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999 to 2008?

# gathering all necessary data - emissions from coal combustion-related sources by year
## defining "coal combustion-related" sources
CombCoal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
CombCoalSources <- SCC[CombCoal,]
## extracting volume of emissions from coal combustion-related sources over analysed period
CCSemissions <- NEI[(NEI$SCC %in% CombCoalSources$SCC), ]
CCSemissionsY <- aggregate(Emissions ~ year, CCSemissions, sum)

# making plot
png("plot4.png", height=500, width=700)
ggplot(CCSemissionsY, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity", fill="grey", colour="black", width=.5) +
        xlab("year") +
        ylab(expression("PM"[2.5]*" emissions (in tonnes)")) +
        ggtitle("Emissions from coal combustion-related sources , period 1999 - 2008")
dev.off()

# answer - emissions from coal combustion-related sources decreased from 572.127 tones/year in the year 1999 to 343.432 tones/year in the year 2005 
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

# plot 6

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

# gathering all necessary data - emissions from motor vehicle sources in  Baltimore City and in Los Angeles
## emissions from motor vehicle sources in Baltimore City
emissionsBaltimoreMVehicle <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
emissionsBaltimoreMVehicleY <- aggregate(Emissions ~ year, emissionsBaltimoreMVehicle, sum)

### indicating of the city
emissionsBaltimoreMVehicleY$city <- "Baltimore City"

## emissions from motor vehicle sources in Los Angeles
emissionsLAngelesMVehicle <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
emissionsLAngelesMVehicleY <- aggregate(Emissions ~ year, emissionsLAngelesMVehicle, sum)

### indicating of the city
emissionsLAngelesMVehicleY$city <- "Los Angeles County"

## emissions from motor vehicle sources in both cities
emissionsBothCities <- rbind(emissionsBaltimoreMVehicleY, emissionsLAngelesMVehicleY)

# making plot
png("plot6.png", height=500, width=700)
ggplot(emissionsBothCities, aes(x=factor(year), y=Emissions, fill=city)) +
        guides(fill=FALSE)+
        geom_bar(stat="identity") + 
        facet_grid(scales="free", .~ city) +
        ylab("total emissions (tons)") + 
        xlab("year") +
        ggtitle(expression("Emissions from motor vehicle sources - Baltimore City and Los Angeles County\nperiod 1999 - 2008"))
dev.off()

#answer - Los Angeles County had greater changes in emissions of particulate matter from motor vehicles 
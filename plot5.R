#######################################################
# Subset just data about Motor Vehicle Emissions
#######################################################

rows2 <- grep("Vehicle", SCC$SCC.Level.Two)
MVcodes <- as.character(SCC[rows2,1])
data1 <- NEI[NEI$SCC %in% MVcodes,]
data1 <- group_by(data1, year)

data2 <- mutate(data1, eyear = mean(Emissions))
data2_BC <- subset(data2, fips == "24510")

#####################################################
# Create plot
#####################################################

png(filename = "plot5.png")
qplot(year, eyear, data=data2, 
      ylab = "Average Emissions (tons)",
      geom=c("point", "line"), 
      main = "Average Emissions from Motor Vehicles in 
      Baltimore City, MD")
dev.off()
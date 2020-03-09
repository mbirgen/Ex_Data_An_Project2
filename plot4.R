#######################################################
# Subset just data about coal
#######################################################
rows1 <- grepl("Coal", SCC$EI.Sector)
coalcodes <- as.character(SCC[rows1,1])
data1 <- NEI[NEI$SCC %in% coalcodes,]
data1 <- group_by(data1, year)
data2 <- mutate(data1, eyear = mean(Emissions))

#####################################################
# Create plot
#####################################################

png(filename = "plot4.png")
qplot(year, eyear, data=data2, 
      ylab = "Average Emissions (tons)",
      geom=c("point", "line"), 
      main = "Average Emissions from Coal")
dev.off()
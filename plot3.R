# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have 
# seen decreases in emissions from 1999–2008 for Baltimore 
# City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this 
# question.

# Note, we will be using NEI_BC data
library(ggplot2, dplyr)
data1 <- group_by(NEI_BC, year, type)
data2 <- summarise(data1, eyear = mean(Emissions))

#####################################################
# Create plot
#####################################################

png(filename = "plot3.png")
qplot(year, eyear, data=data2, color = type, 
      ylab = "Average Emissions (tons)",
      geom=c("point", "line"), 
      main = "Average Emissions for Baltimore City, MD by Source")
dev.off()
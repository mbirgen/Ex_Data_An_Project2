### Extract Data
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##################################################
# Create data
##################################################
years0 <-unique(NEI$year)
data0 <- tapply(NEI$Emissions, NEI$year, sum)
ylabels <- range(data0/1000000)
totalEmissions <- data.frame(year = years0, 
                             total.emissions = data0/1000000)
#################################################
# Create first plot
#################################################

png(filename = "plot1.png")
  plot(totalEmissions, ylab = "total emissions (million tons)", 
       pch = 19,
       axes = FALSE, ylim = c(0,8)) ## Plot data
  axis(side = 1, at = years0) ## Create x-axis
  axis(side=2, at = c(0:8), las=2) ## Create y-axis
dev.off()
###############################
# subset out data for Baltimore City, Maryland (fips=="24510")
###############################
NEI_BC <- subset(NEI, fips == "24510")
data1 <- with(NEI_BC, data0 <- tapply(Emissions, year, sum))
totalEmissions1 <- data.frame(year = years0, 
                             total.emissions = data1/1000)
#################################################
# Create second plot
#################################################

png(filename = "plot2.png")
plot(totalEmissions1, ylab = "total emissions (thousand tons)", 
     axes = FALSE, ylim = c(0,4), pch = 19, col = "dark green",
     main = "Total Emissions for Baltimore City, Maryland") ## Plot data
axis(side = 1, at = years0) ## Create x-axis
axis(side=2, at = c(0:4), las=2) ## Create y-axis
dev.off()
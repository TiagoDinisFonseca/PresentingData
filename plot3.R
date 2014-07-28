# Plot 3

# Loading the ggplot2 library
library(ggplot2)

# Reading the data
source("reading_data.R")

# Preparing the data
message("Preparing data...")
tmp <- subset(NEI, fips == "24510")
data_y <- data.frame(tmp$Emissions)
filter <- subset(tmp, select = c("type", "year"))
data <- aggregate(data_y, filter, sum)

# Doing the plot
pl <- qplot(data = data, y = tmp.Emissions, x = year, group = type, xlab = "year", ylab = "Emissions (tons)", main = "Emissions, Baltimore") + geom_smooth(method = lm, se = F) + facet_wrap(~type, ncol = 2) + ylim(0, 2200)
png('plot3.png', width = 480, height = 480)
print(pl)
dev.off()
message("Created the plot on the file \'plot3.png\'")

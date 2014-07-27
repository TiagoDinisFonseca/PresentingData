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
png('plot3.png', width = 480, height = 480)
qplot(data = data, y = tmp.Emissions, x = year, facets = type ~ ., xlab = "year", ylab = "Emissions", main = "Emissions, Baltimore") + geom_smooth(method = lm)
dev.off()
message("Created the plot on the file \'plot3.png\'")

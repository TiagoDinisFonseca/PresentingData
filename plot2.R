# Plot 2

# Reading the data
source("reading_data.R")

# Preparing the data
message("Preparing data...")
tmp <- subset(NEI, fips == "24510")
data_y <- data.frame(tmp$Emissions)
filter <- data.frame(tmp$year)
data <- aggregate(data_y, filter, sum)

# Doing the plot
png('plot2.png', width = 480, height = 480)
plot(data$tmp.year, data$tmp.Emissions, main = "Emissions from all sources, Baltimore", xlab = "year", ylab = "Emissions (tons)", col = "red", type = "b")
dev.off()
message("Created the plot on the file \'plot2.png\'")

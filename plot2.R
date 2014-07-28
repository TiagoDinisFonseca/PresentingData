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
plot(data$tmp.year, data$tmp.Emissions, main = "Emissions from all sources, Baltimore", xlab = "year", ylab = "Emissions (tons)", col = "black", type = "p", ylim = c(0, max(data$tmp.Emissions)), axes = F)
box()
axis(2)
axis(1, at = data$NEI.year)
abline(lm(data$tmp.Emissions ~ data$tmp.year), col = "red")
dev.off()
message("Created the plot on the file \'plot2.png\'")

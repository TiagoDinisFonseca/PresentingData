# Plot 1

# Reading the data
source("reading_data.R")

# Preparing the data
message("Preparing data...")
data_y <- data.frame(NEI$Emissions)
filter <- data.frame(NEI$year)
data <- aggregate(data_y, filter, sum)

# Doing the plot
png('plot1.png', width = 480, height = 480)
plot(data$NEI.year, data$NEI.Emissions, main = "Emissions from all sources, US", xlab = "year", ylab = "Emissions (tons)", col = "black", type = "p", ylim = c(0, max(data$NEI.Emissions)), axes = F)
box()
axis(2)
axis(1, at = data$NEI.year)
abline(lm(data$NEI.Emissions ~ data$NEI.year), col = "red")
dev.off()
message("Created the plot on the file \'plot1.png\'")

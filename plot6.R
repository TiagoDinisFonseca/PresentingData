# Plot 6

# Loading the ggplot2 library
library(ggplot2)

# Reading the data
source("reading_data.R")

# Preparing cities
Codes <- c("24510", "06037")
Places <- data.frame(cbind(Codes, c("Baltimore", "Los Angelos")))
colnames(Places) <- c("fips", "place")

# Preparing the data
# Assuming that on-road is the motor vehicle pollution...
message("Preparing data...")
tmp <- subset(NEI, type == "ON-ROAD" & fips %in% Codes)
data_y <- data.frame(tmp$Emissions)
filter <- subset(tmp, select = c("fips", "year"))
data <- aggregate(data_y, filter, sum)
data <- merge(data, Places)

# Doing the plot
pl <- qplot(data = data, y = tmp.Emissions, x = year, group = place, xlab = "year", ylab = "Emissions (tons)", main = "Emissions from motor vehicle source") + geom_smooth(method = lm, se = F) + facet_wrap(~place, ncol = 2) + ylim(0, max(data$tmp.Emissions))
png('plot6.png', width = 480, height = 480)
print(pl)
dev.off()
message("Created the plot on the file \'plot6.png\'")

# Load necessary libraries
library(tidyverse)

# Load the dataset
data <- read.csv("DataAnalyst.csv")

# Remove rows with -1 in the 'Founded' or 'Rating' columns
filtered_data <- data %>%
  filter(Founded != -1 & Rating != -1)

# Save visualizations to a PDF
pdf("visualization.pdf")

# Scatter Plot with Linear Trendline
ggplot(filtered_data, aes(x = Founded, y = Rating)) +
  geom_point(color = "blue", alpha = 0.7) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add regression line
  labs(title = "Scatter Plot of Glassdoor Rating vs. Company Founded Year",
       x = "Company Founded Year",
       y = "Glassdoor Rating (Scale 1-5)") +
  theme_minimal()


# Histogram with Normal Curve Overlay for Ratings
ggplot(filtered_data, aes(x = Rating)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
  stat_function(fun = dnorm, args = list(mean = mean(filtered_data$Rating), 
                                         sd = sd(filtered_data$Rating)), 
                color = "red", size = 1) +
  labs(title = "Histogram of Glassdoor Ratings of a Company",
       x = "Glassdoor Rating (Scale 1-5)",
       y = "Density") +
  theme_minimal()

# Histogram with Normal Curve Overlay for Founded Year
ggplot(filtered_data, aes(x = Founded)) +
  geom_histogram(aes(y = ..density..), binwidth = 10, fill = "green", color = "black", alpha = 0.7) +
  stat_function(fun = dnorm, args = list(mean = mean(filtered_data$Founded), 
                                         sd = sd(filtered_data$Founded)), 
                color = "red", size = 1) +
  labs(title = "Histogram of Company Founded Year",
       x = "Company Founded Year",
       y = "Density") +
  theme_minimal()

# Close the PDF device
dev.off()

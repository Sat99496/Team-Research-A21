# Load necessary libraries
library(tidyverse)

# Load the dataset
data <- read.csv("DataAnalyst.csv")

# Remove rows with -1 in the 'Founded' or 'Rating' columns
filtered_data <- data %>%
  filter(Founded != -1 & Rating != -1)

# Conduct Pearson's r correlation analysis
pearson_correlation <- cor(filtered_data$Founded, filtered_data$Rating, method = "pearson")

# Display the result
cat("Pearson's r Correlation Coefficient:\n")
cat("The correlation between Company Founded Year and Glassdoor Rating is:", pearson_correlation, "\n")

# Perform hypothesis testing for correlation
cor_test <- cor.test(filtered_data$Founded, filtered_data$Rating, method = "pearson")

# Display hypothesis test results
cat("\nPearson's r Hypothesis Test Results:\n")
print(cor_test)

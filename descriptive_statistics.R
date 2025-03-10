# Load necessary libraries
library(dplyr)

# Load cleaned data
data_clean <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/cleaned_data.csv")

# Disable scientific notation
options(scipen = 100)

# Summary statistics
summary(data_clean$log_returns_ibov)
summary(data_clean$log_returns_nasdaq)
summary(data_clean$log_returns_spx)

# Standard deviations
sd(data_clean$log_returns_ibov)
sd(data_clean$log_returns_nasdaq)
sd(data_clean$log_returns_spx)

# Save summary to file
sink("/Users/goliveirater/Downloads/TERRAmacroeconometrics/descriptive_statistics.txt")
cat("Summary Statistics for Log Returns:\n")
print(summary(data_clean$log_returns_ibov))
print(summary(data_clean$log_returns_nasdaq))
print(summary(data_clean$log_returns_spx))

cat("\nStandard Deviations:\n")
print(sd(data_clean$log_returns_ibov))
print(sd(data_clean$log_returns_nasdaq))
print(sd(data_clean$log_returns_spx))
sink()

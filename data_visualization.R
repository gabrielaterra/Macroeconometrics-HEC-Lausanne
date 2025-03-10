# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load cleaned data
data_clean <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/cleaned_data.csv")

# Convert Time column to POSIXct format
data_clean <- data_clean %>%
  mutate(Time = ymd_hms(Time))

# Normalizing data to 100
normalized_data <- data_clean %>%
  mutate(
    Ibov_norm = 100 * (IBOV / first(IBOV)),
    SPX_norm = 100 * (SPX / first(SPX)), 
    NASDAQ_norm = 100 * (NDX / first(NDX))
  )

# Plot normalized time series
ggplot(normalized_data, aes(x = Time)) +
  geom_line(aes(y = Ibov_norm, color = "IBOV")) +
  geom_line(aes(y = SPX_norm, color = "SPX500")) +
  geom_line(aes(y = NASDAQ_norm, color = "NDX")) +
  labs(
    x = "Day", 
    y = "Normalized Closing Values", 
    color = "Index", 
    title = "Normalized Variation of the Indexes"
  ) +
  scale_x_datetime(date_labels = "%d/%m", date_breaks = "2 days") +
  scale_color_manual(values = c("IBOV" = "pink", "SPX500" = "orange", "NDX" = "violet")) +
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, vjust = -0.5))


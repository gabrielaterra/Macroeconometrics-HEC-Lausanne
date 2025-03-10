# Load necessary libraries
library(dplyr)
library(tidyverse)
library(readxl)

# ---- Collecting the data ----
data1 <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/ibov2812.csv", col.names = c("Time", "Open", "High", "Low", "IBOV"))
data2 <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/spx2812.csv", col.names = c("Time", "Open2", "High2", "Low2", "SPX"))
data3 <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/nasdaq2812.csv", col.names = c("Time", "Open3", "High3", "Low3", "NDX"))

# Merging datasets
merged_df <- merge(merge(data1, data2, by = "Time", all = TRUE), data3, by = "Time", all = TRUE)

# Computing returns and log returns
merged_df <- merged_df %>% 
  mutate(
    returns_ibov = (IBOV - lag(IBOV)) / lag(IBOV), 
    returns_spx = (SPX - lag(SPX)) / lag(SPX), 
    returns_nasdaq = (NDX - lag(NDX)) / lag(NDX)
  ) %>%
  mutate(
    log_returns_spx = log(1 + returns_spx),
    log_returns_ibov = log(1 + returns_ibov),
    log_returns_nasdaq = log(1 + returns_nasdaq)
  )

# Removing NA values
data_clean <- merged_df[complete.cases(merged_df),]

# Transforming the "Time" column (everything in GMT-3)
library(lubridate)
data_clean <- data_clean %>%
  mutate(Time = ymd_hms(substring(Time, 1, 19)) %>% force_tz("America/Sao_Paulo"))

# Save cleaned data
write.csv(data_clean, "/Users/goliveirater/Downloads/TERRAmacroeconometrics/cleaned_data.csv", row.names = FALSE)


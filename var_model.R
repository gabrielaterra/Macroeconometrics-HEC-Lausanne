# Load necessary libraries
library(vars)

# Load cleaned data
data_clean <- read.csv("/Users/goliveirater/Downloads/TERRAmacroeconometrics/cleaned_data.csv")

# Selecting relevant columns
var_data <- data_clean[, c("log_returns_spx", "log_returns_ibov")]

# Choosing optimal lag
lag_selection <- VARselect(var_data, lag.max = 8, type = "const")

# Fitting the VAR model
var_model <- VAR(var_data, p = 1)

# Saving results
sink("/Users/goliveirater/Downloads/TERRAmacroeconometrics/var_model_summary.txt")
cat("VAR Model Summary:\n")
print(summary(var_model))
sink()

# Performing Granger causality test
causality_spx <- causality(var_model, cause = "log_returns_spx")
causality_ibov <- causality(var_model, cause = "log_returns_ibov")

sink("/Users/goliveirater/Downloads/TERRAmacroeconometrics/var_model_granger.txt")
cat("Granger Causality Test Results:\n")
print(causality_spx)
print(causality_ibov)
sink()

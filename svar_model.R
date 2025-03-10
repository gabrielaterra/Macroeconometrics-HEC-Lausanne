# Load necessary libraries
library(vars)
library(TSstudio)
library(urca)

# Load cleaned data
sink("/Users/goliveirater/Downloads/TERRAmacroeconometrics/var_model_summary.txt")

# Selecting relevant columns
var_data <- data_clean[, c("log_returns_spx", "log_returns_ibov")]
var_model <- VAR(var_data, p = 1)

# Creating SVAR Restrictions
amat <- diag(2)
amat[2,1] <- NA  # Lower triangular matrix for Cholesky decomposition

# Estimating the SVAR model
svar_model <- SVAR(var_model, Amat = amat)

# Saving model summary
sink("/Users/goliveirater/Downloads/TERRAmacroeconometrics/svar_model_summary.txt")
cat("SVAR Model Summary:\n")
print(summary(svar_model))
sink()

# Estimating impulse response functions
svar_irf_spx <- irf(svar_model, impulse = "log_returns_spx", response = "log_returns_ibov", n.ahead = 10, boot = TRUE)
svar_irf_ibov <- irf(svar_model, impulse = "log_returns_ibov", response = "log_returns_spx", n.ahead = 10, boot = TRUE)

# Saving IRF plots
png("/Users/goliveirater/Downloads/TERRAmacroeconometrics/svar_irf_spx.png", width = 800, height = 600)
plot(svar_irf_spx)
dev.off()

png("/Users/goliveirater/Downloads/TERRAmacroeconometrics/svar_irf_ibov.png", width = 800, height = 600)
plot(svar_irf_ibov)
dev.off()


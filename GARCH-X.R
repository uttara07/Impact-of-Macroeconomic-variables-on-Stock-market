#GARCH-X

# Load required packages
install.packages(rugarch)
install.packages(readr)
library(rugarch)
library(readr)

# Align data lengths
returns_df <- na.omit(data.frame(
  Y = diff(log(data$Y)) * 100,
  X1 = diff(log(data$X1)) * 100,
  X2 = diff(log(data$X2)) * 100,
  X3 = diff(log(data$X3)) * 100,
  X4 = diff(log(data$X4)) * 100,
  X5 = diff(log(data$X5)) * 100,
  X6 = diff(log(data$X6)) * 100
))

# Define GARCH-X model with multiple exogenous variables
garch_spec <- ugarchspec(
  variance.model = list(model = "sGARCH", garchOrder = c(1,1),
                        external.regressors = as.matrix(returns_df[, -1])),  # All except 'Y'
  mean.model = list(armaOrder = c(1,0), include.mean = TRUE),
  distribution.model = "norm"
)

# Fit the model

# Fit the model
garch_fit <- ugarchfit(spec = garch_spec, data = returns_df$Y)
show(garch_fit)

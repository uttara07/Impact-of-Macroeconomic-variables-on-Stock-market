#ARCH-LM TEST
# Load required packages
library(lmtest)
library(tseries)
# Fit OLS model
ols_model <- lm(Y ~ 1)  # Constant mean

# Apply ARCH-LM test (Breusch-Godfrey test with squared residuals)
bgtest(ols_model, order = 12, type = "Chisq")

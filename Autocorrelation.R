#(2)Checking for the Autocorrelation(DW Test)
# Load required package
install.packages(lmtest)
library(lmtest)

# Variables to test

variables <- c("y", "x1", "x2", "x3", "x4", "x5","x6")

cat("----- Durbin-Watson Test for Autocorrelation -----\n")

for(var in variables)
{
  cat("\nVariable:", var, "\n")
  y <- ts(data[[var]])
  model <- lm(y ~ lag(y, -1), na.action = na.omit)  # simple AR(1) model
  dw <- dwtest(model)
  print(dw)
}

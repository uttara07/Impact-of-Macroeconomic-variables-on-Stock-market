#Granger Causality Test (Including all Variables)
# Load required package
library(lmtest)

grangertest(Y ~ X1, order = 2, data = data) #Example: Does exchange_rate Granger-cause sensex?
variables <- c("X1", "X2", "X3", "X4", "X5","X6")
for (var in variables)
{
  cat("\n--- Granger Causality Test:", var, "→ sensex ---\n")
  test <- grangertest(data$sensex ~ data[[var]], order = 2)
  print(test)
} #adjust order = 2 depending on lag selection criteria (AIC/BIC)

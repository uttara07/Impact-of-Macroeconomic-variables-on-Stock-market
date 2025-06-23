#(3)Checking for the  Heteroscedasticity (BP Test)
# Load required packages
library(lmtest)
library(car)

cat("\n----- Breusch-Pagan Test for Heteroscedasticity -----\n")

for(var in variables)
{
  cat("\nVariable:", var, "\n")
  y <- ts(data[[var]])
  model <- lm(y ~ lag(y, -1), na.action = na.omit)  # again a simple AR(1)
  bp <- bptest(model)
  print(bp)
}

#Saving the outcome in a table 

bp_results <- data.frame(Variable = character(), BP_Statistic = numeric(), P_Value = numeric(), stringsAsFactors = FALSE)

for (var in variables)
{
  y <- ts(data[[var]])
  model <- lm(y ~ lag(y, -1), na.action = na.omit)
  test <- bptest(model)
  bp_results <- rbind(bp_results, data.frame(Variable = var, BP_Statistic = test$statistic, P_Value = test$p.value))
}
bp_results


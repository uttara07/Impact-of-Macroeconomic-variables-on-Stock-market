#(1)Checking the stationarity (ADF Test)
install.packages(tseries)
library(tseries)

# Loop through each variable
for (var in variables)
{
  cat("\n--- ADF Test for:", var, "---\n")
  series <- ts(data[[var]])
  result <- adf.test(series, alternative = "stationary")
  print(result)
}

#Saving the above result in a table 

adf_results <- data.frame(Variable = character(), P_Value = numeric(), stringsAsFactors = FALSE)

for (var in variables) {
  series <- ts(data[[var]])
  test <- adf.test(series)
  adf_results <- rbind(adf_results, data.frame(Variable = var, P_Value = test$p.value))
}

print(adf_results)

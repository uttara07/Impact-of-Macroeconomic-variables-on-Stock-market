#Load required library
install.packages(FinTS)
library(FinTS)

variables <- c("Y", "X1", "X2", "X3", "X4", "X5","X6")

for (var in variables)
{
  cat("\n--- ARCH Test for:", var, "---\n")
  series <- ts(data[[var]])
  print(ArchTest(series, lags = 12)) 
} #If p-value < 0.05, ARCH effect is present
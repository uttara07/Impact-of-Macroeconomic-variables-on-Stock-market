#Cointegration Test (Johansen Test – Including all Variables)
# Load required package
library(urca)

# Create a matrix of all variables (assuming they are all I(1))
a <- data[, c("Y", "X1", "X2", "X3", "X4", "X5","X6")]
a_ts <- ts(a) #Convert to time series matrix

# Apply Johansen Cointegration Test
johansen_test <- ca.jo(a_ts, type = "trace", ecdet = "const", K = 2)
summary(johansen_test) # K = 2 specifies the number of lags, use VARselect() from vars package to choose optimal lag.

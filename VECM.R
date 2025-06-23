#VECM (Including all Variables)
# Load required libraries
library(urca)
library(vars)

# Convert data to time series matrix
a <- data[, c("Y", "X1", "X2", "X3", "X4", "X5","X6")]
a_ts <- ts(a)
# Johansen test 
johansen_test <- ca.jo(a_ts, type = "trace", ecdet = "const", K = 2)
vecm_model <- cajorls(johansen_test, r = 1)  #r = number of cointegration relationships
summary(vecm_model$rlm) #change r = 1 based on Johansen test result’s trace statistic.
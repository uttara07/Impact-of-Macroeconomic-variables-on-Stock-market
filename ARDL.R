#ARDL (Including all Variables)
# Load required package
install.packages(dynlm)
library(dynlm)
ardl_model <- dynlm(sensex ~ L(Y, 1) + L(X1, 1) + L(X2, 1) +
                      L(X3, 1) + L(X4, 1) + L(X5, 1),L(X6,1), data = data)
summary(ardl_model)
bounds_test <- bounds_f_test(ardl_model)
summary(bounds_test)

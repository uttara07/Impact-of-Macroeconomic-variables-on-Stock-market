#(4)Checking for the Multicollinearity

library(car)
model <- lm(y ~ x1 +x2 + x3 + x4 + x5 + x6, data = data) # Build a multiple linear regression model
summary(model)
vif(model) # Check VIF

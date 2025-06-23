# PCA (Principal Component Analysis)
# Load required packages
install.packages(readr)
install.packages(stats)
install.packages(ggplot2)
library(readr)
library(stats)
library(ggplot2)

# Select relevant numeric columns
features <- data[, c("Y", "X1", "X2", "X3", "X4","X5","X6")] #These variables are transformed variables
features_scaled <- scale(features) #Standardize the data

# Perform PCA
pca_result <- prcomp(features_scaled, center = TRUE, scale. = TRUE)
summary(pca_result)
biplot(pca_result)


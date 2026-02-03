# Load necessary libraries
library(tidyverse)   # For general data wrangling
library(ggplot2)     # For plotting
library(corrplot)    # For correlation plots
library(cluster)     # For clustering
library(MASS)        # For logistic regression
library(caret)       # For linear regression
library(ggcorrplot)  # For better correlation plots

# Import the dataset (replace with your student number)
dataset <- read.csv("D:/CN5003CWK2.csv")  # Adjust file name to match your dataset

# View the first few rows of the dataset
head(dataset)


# Summary of the dataset
summary(dataset)

# Show column names (headings) of the dataset
colnames(dataset)






#  Data Visualization






# Histogram for a numeric variable, e.g., spkts
ggplot(dataset, aes(x = spkts)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) + 
  labs(title = "Histogram of spkts", x = "spkts", y = "Frequency")

# Boxplot for a numeric variable, e.g., spkts
ggplot(dataset, aes(y = spkts)) + 
  geom_boxplot(fill = "red", color = "black") +
  labs(title = "Boxplot of spkts", y = "spkts")

# Scatter plot for two variables, e.g., spkts vs dpkts
ggplot(dataset, aes(x = spkts, y = dpkts)) +
  geom_point(color = "green") + 
  labs(title = "Scatter plot of spkts vs dpkts", x = "spkts", y = "dpkts")

# Line plot for numeric variables, e.g., spkts over time or index
ggplot(dataset, aes(x = seq_along(spkts), y = spkts)) + 
  geom_line(color = "purple") + 
  labs(title = "Line plot of spkts", x = "Index", y = "spkts")







# Correlation Analysis






# Calculate correlation matrix
cor_matrix <- cor(dataset[, sapply(dataset, is.numeric)])

# Plot the correlation matrix
corrplot(cor_matrix, method = "circle", type = "upper", tl.cex = 0.7)

# Pairs plot (scatter plot matrix)
pairs(dataset[, c("spkts", "dpkts", "sbytes", "dbytes")], 
      main = "Scatterplot Matrix", pch = 19, col = rgb(0,0,1,0.5))





# Cluster Analysis





# Select only numeric variables for clustering
data_numeric <- dataset[, sapply(dataset, is.numeric)]

# Perform k-means clustering
set.seed(123)  # Set seed for reproducibility
kmeans_result <- kmeans(data_numeric, centers = 3)

# Add cluster results to the dataset
dataset$cluster <- as.factor(kmeans_result$cluster)

# Cluster plot
ggplot(dataset, aes(x = spkts, y = dpkts, color = cluster)) + 
  geom_point() + 
  labs(title = "Cluster plot for spkts vs dpkts", x = "spkts", y = "dpkts")





# Multiple Linear Regression Model





# Build a multiple linear regression model
mlr_model <- lm(label ~ spkts + dpkts + sbytes + dbytes, data = dataset)

# View the summary of the model
summary(mlr_model)

# The equation of the model
cat("Multiple Linear Regression Equation: \n")
cat("label = ", round(coef(mlr_model)[1], 2), 
    "+", round(coef(mlr_model)[2], 2), "* spkts",
    "+", round(coef(mlr_model)[3], 2), "* dpkts",
    "+", round(coef(mlr_model)[4], 2), "* sbytes",
    "+", round(coef(mlr_model)[5], 2), "* dbytes\n")




# Logistic Regression Model




# Build a logistic regression model
logr_model <- glm(label ~ spkts + dpkts + sbytes + dbytes, 
                  data = dataset, 
                  family = binomial)

# View the summary of the model
summary(logr_model)

# The equation of the logistic regression model
cat("Logistic Regression Equation: \n")
cat("logit(label) = ", round(coef(logr_model)[1], 2), 
    "+", round(coef(logr_model)[2], 2), "* spkts",
    "+", round(coef(logr_model)[3], 2), "* dpkts",
    "+", round(coef(logr_model)[4], 2), "* sbytes",
    "+", round(coef(logr_model)[5], 2), "* dbytes\n")












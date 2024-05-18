# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(caret)

# Load the dataset
dataset <- read.csv("C:/Users/badda/Downloads/2018-2019_Daily_Attendance_20240429.csv")

# Explore the dataset
head(dataset)
summary(dataset)

# Check for missing values
sum(is.na(dataset))

# Preprocess the data as necessary (e.g., handle missing values, convert data types)

# Linear Regression
# Example: Predict attendance based on other variables
linear_model <- lm(Attendance ~ ., data = dataset)

# Summary of the linear regression model
summary(linear_model)

# Polynomial Regression
# Example: Fit a polynomial regression model
# You can choose appropriate degree for polynomial features
polynomial_model <- lm(Attendance ~ poly(Feature1, 2) + poly(Feature2, 2), data = dataset)

# Summary of the polynomial regression model
summary(polynomial_model)

# Logistic Regression
# Example: If applicable (for binary classification tasks)
# logistic_model <- glm(Outcome ~ ., data = dataset, family = "binomial")
# summary(logistic_model)

# Visualization (optional)
# Example: Scatter plot of attendance vs. feature
ggplot(data = dataset, aes(x = Feature1, y = Attendance)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Feature 1", y = "Attendance", title = "Linear Regression")

# Additional visualization and analysis as needed


# Load Attendance Dataset
attendance_data <- read.csv(file.choose())
attendance_data

# Install dplyr package if not already installed
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Display the first few rows of the dataset
head(attendance_data)

# 1. Linear Regression
# Linear regression to predict Absent based on Enrolled
linear_model <- lm(Absent ~ Enrolled, data = attendance_data)
summary(linear_model)

# Visualization for Linear Regression
ggplot(attendance_data, aes(x = Enrolled, y = Absent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "blue") +
  labs(title = "Linear Regression: Absent vs Enrolled", x = "Enrolled", y = "Absent")

# 2. Polynomial Regression
# Polynomial regression to predict Absent based on Enrolled
poly_model <- lm(Absent ~ poly(Enrolled, 2), data = attendance_data)
summary(poly_model)

# Visualization for Polynomial Regression
ggplot(attendance_data, aes(x = Enrolled, y = Absent)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, col = "red") +
  labs(title = "Polynomial Regression: Absent vs Enrolled", x = "Enrolled", y = "Absent")

# 3. Logistic Regression
# Convert Released to a binary variable (0 for Not Released, 1 for Released)
attendance_data <- attendance_data %>%
  mutate(Released_binary = ifelse(Released == "Released", 1, 0))

# Logistic regression to predict Released_binary based on Absent
logistic_model <- glm(Released_binary ~ Absent, data = attendance_data, family = binomial)
summary(logistic_model)

# Visualization for Logistic Regression
ggplot(attendance_data, aes(x = Absent, y = Released_binary)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = binomial), se = FALSE, col = "green") +
  labs(title = "Logistic Regression: Released vs Absent", x = "Absent", y = "Probability of Released")

# Logistic regression to predict Released_binary based on Absent with increased max iterations
logistic_model <- glm(Released ~ Absent, data = attendance_data, family = binomial, maxit = 100)
summary(logistic_model)

# Additional Plots for Visualization
# Scatter plot with linear regression line
plot1 <- ggplot(attendance_data, aes(x = Enrolled, y = Absent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Linear Regression Line", x = "Enrolled", y = "Absent")

# Scatter plot with polynomial regression line
plot2 <- ggplot(attendance_data, aes(x = Enrolled, y = Absent)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  labs(title = "Scatter Plot with Polynomial Regression Line", x = "Enrolled", y = "Absent")

# Print the plots
print(plot1)
print(plot2)





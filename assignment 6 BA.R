library(ggplot2)
library(plot3D)

# Install and load ggplot2
install.packages("ggplot2")
library(ggplot2)

# Install and load plot3D
install.packages("plot3D")
library(plot3D)

data(mtcars)
head(mtcars)

# Select two variables for clustering
mtcars_data <- mtcars[, c("mpg", "hp")]
head(mtcars_data)

# Convert to matrix
mat <- as.matrix(mtcars_data)
head(mat)

# K-means clustering
set.seed(123) # For reproducibility
kmeans_result <- kmeans(mat, centers=3)
print(kmeans_result)

# Add cluster to data
mtcars$cluster <- factor(kmeans_result$cluster)
head(mtcars)
summary(mtcars)

# Perform k-means clustering on mtcars data
data(mtcars)
mtcars_data <- mtcars[, c("mpg", "hp")]

# Convert to matrix
mat <- as.matrix(mtcars_data)

# K-means clustering
set.seed(123) # For reproducibility
kmeans_result <- kmeans(mat, centers=3)

# Add cluster to data
mtcars$cluster <- factor(kmeans_result$cluster)

# Plot clustered data using ggplot
ggplot(mtcars, aes(x = mpg, y = hp, color = cluster)) +
  geom_point(size = 3) +
  labs(title = "K-means Clustering on mtcars (mpg vs hp)", x = "Miles Per Gallon (mpg)", y = "Horsepower (hp)") +
  theme_minimal()

# Plot clustered data using ggplot
ggplot(mtcars, aes(x = mpg, y = hp, color = cluster)) +
  geom_point(size = 3) +
  labs(title = "K-means Clustering on mtcars (mpg vs hp)", x = "Miles Per Gallon (mpg)", y = "Horsepower (hp)") +
  theme_minimal()

# K-means clustering on mpg
kmeans_result <- kmeans(mtcars$mpg, centers=3)
print(kmeans_result)

# Add cluster to data
mtcars$mpg_cluster <- factor(kmeans_result$cluster)

# Plot clustered data
qplot(data=mtcars, y=mpg, color=mpg_cluster, main="K-means Clustering on mtcars (mpg)")


# Select three variables for clustering
mtcars_data <- mtcars[, c("mpg", "hp", "wt")]
head(mtcars_data)

# Convert to matrix
mat <- as.matrix(mtcars_data)
head(mat)

# K-means clustering
kmeans_result <- kmeans(mat, centers=3)
print(kmeans_result)

# Add cluster to data
mtcars$cluster_3d <- factor(kmeans_result$cluster)

# Plot clustered data
qplot(data=mtcars, y=mpg, color=cluster_3d, main="K-means Clustering on mtcars (mpg)")
qplot(data=mtcars, y=hp, color=cluster_3d, main="K-means Clustering on mtcars (hp)")
qplot(data=mtcars, y=wt, color=cluster_3d, main="K-means Clustering on mtcars (wt)")

# 3D scatter plot
scatter3D(mtcars$mpg, mtcars$hp, mtcars$wt, colvar=as.numeric(mtcars$cluster_3d), 
          xlab = "mpg", ylab = "hp", zlab = "wt", main="3D K-means Clustering on mtcars")


# Select three variables for clustering
mtcars_data <- mtcars[, c("mpg", "hp", "wt")]
head(mtcars_data)

# Convert to matrix
mat <- as.matrix(mtcars_data)
head(mat)

# Determine within-cluster sum of squares for different numbers of clusters
wss <- rep(0, 15)
for (k in 1:15) {
  wss[k] <- sum(kmeans(mat, centers=k, nstart=50)$withinss)
}
wss

# Plot the WSS to find the "elbow"
plot(wss, type="b", main="Elbow Method for Choosing Number of Clusters", xlab="Number of Clusters", ylab="Within groups sum of squares")

# K-means clustering with the optimal number of clusters
kmeans_result <- kmeans(mat, centers=3)
print(kmeans_result)

# Add cluster to data
mtcars$optimal_cluster <- kmeans_result$cluster

# 3D scatter plot with optimal clusters
scatter3D(mtcars$mpg, mtcars$hp, mtcars$wt, colvar=as.numeric(mtcars$optimal_cluster), 
          xlab = "mpg", ylab = "hp", zlab = "wt", main="3D K-means Clustering on mtcars with Optimal Clusters")




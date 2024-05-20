#creating a vector for random numbers
x <-rnorm(5)
x
#printing another example on vector math
N <-100000
N
a <-rnorm(N)
a
b <- rnorm(N)
b
# printing Vectorized approach
c <- a * b
c
#checking all these are valid function calls
X <- rnorm(5)
X
X <- rnorm( 5, 10, 1)
X
X <- rnorm (5, 10)
X
X <- rnorm(5, mean=10, sd = 1)
X
X <- rnorm(5, sd=1, mean=10)
X
X <- rnorm(5, sd=1)
X
#printing some simple graphics
x <-rnorm(100)
plot(x)
hist(x)
#printing basic R statistics tools
x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)

#classwork 3
#generate the vector of numbers
x <-rnorm(100000)
# count how many are between -1 and 1
count <- 0
for (i in x)
  if (i>-1 & i<1)
    count <- count+1
# Get and print the percentage, should be around 68%
percent <- count/length(x)
percent
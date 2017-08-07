
#If you don't have the stats package installed, install it here
#install.packages("stats")
#library("stats")

#descriptive statistics
range(mtcars$mpg)
mean(mtcars$mpg)
median(mtcars$mpg)
sd(mtcars$mpg) # standard deviation
var(mtcars$mpg) #variance

#if you want a bunch of stuff at once
summary(mtcars[1:4])

#let's convert to something more readable
carsDf = mtcars
carsDf$cyl <- factor(carsDf$cyl, levels = c(4, 6, 8), labels = c("4cyl", "6cyl", "8cyl"))
carsDf$am <- factor(carsDf$am, levels = c(0,1), labels = c("Automatic", "Manual"))

# we can use the aggregate function to slice our data sets up
aggregate(mpg ~ cyl, data = carsDf, mean) # Average MPG by Cyl
aggregate(mpg ~ am, data = carsDf, mean) #Avgerage MPG by Transmission
aggregate(mpg ~ cyl + am, data = carsDf, mean) # Average MPG by Transmission and Cyl

#covariance
cov(mtcars$mpg, mtcars$hp) #covariance
cov(mtcars[1:4]) # covariance matrix

#correlation
cor(mtcars$mpg, mtcars$hp) #correlation
cor(mtcars[1:4]) # correlation matrix

#pulling random samples from datasets
sample(faithful$eruptions, size = 5)

#linear regression
model_fit = lm(mtcars$mpg ~ mtcars$hp) #build a fitted linear model

summary(model_fit)

plot(mtcars$hp, mtcars$mpg, ylim = c(0, 40))
abline(model_fit) #adds a line to the plot
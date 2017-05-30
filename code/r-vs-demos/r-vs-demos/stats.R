
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
lm(formula = mtcars$mpg ~ mtcars$hp)

summary(model_fit)

plot(mtcars$hp, mtcars$mpg)
abline(model_fit) #adds a line to the plot
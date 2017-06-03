
#we'll be using the built in Iris dataset here

head(iris)
str(iris) # structure of the data
summary(iris)

## K-Means Clustering

#taking the build in iris data set and applying kmeans clustering to predict the species
clusters = kmeans(x = iris[1:4], centers = 3, nstart= 10)

#checking to see how the matches work out
table(x = clusters$cluster, y = iris$Species)

## Decision Trees

#let's get a training dataset and a testing dataset
set.seed(42)
indexes = sample(x = 1:150, size = 100)

training_set = iris[indexes,]
testing_set = iris[-indexes,]

library("rpart")
tree_model = rpart(formula = Species ~ ., data=training_set)

summary(tree_model)

#Let's plot the decision tree
plot(tree_model)
text(tree_model)

predictions = predict(object = tree_model, newdata = testing_set, type="class")

table(x = predictions, y = testing_set$Species)
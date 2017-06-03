# This is a one page guide to R. 
# it consists of an overview of the major features in R and how to get around in the language. 

#Basic Types
num = 1 # numeric, defaults to decimal type
int = as.integer(3) # integer type 
str = "hello" #string (character vector)
bool = TRUE #boolean / logical

#You can check basic types with "is.<type>()"
is.numeric(num)
is.integer(int)
is.character(str)
is.logical(bool)

#Collections

# Vectors, ordered lists of the same type. use the c() function to initialize them
vec = c(1:5) 
vec[1] #can access via a 1 based index
sort(vec)
unique(vec)
table(vec) # gets the count of each vector

#basic math functions you'd expect in a statistical language
max(vec)
min(vec)
sum(vec)

# Matricies, multi dimensional arrays of the same type.
mat = matrix(c(1:10), nrow = 5, ncol = 2) 
mat[2,2] #can access via coordinates (1 based)

#data frames, tabular data
df = data.frame(x = c(1:4), y = c("col1", "col2"), z = c(2:5))
dfm = data.frame(mat) # can make with a matrix
df$x # access each column
df$x[1] #access an individual field
df[df$x > 2,] # SQL like selection of specific columns


#Built In Values
# TRUE / FALSE - boolean literals
# NaN - not a number
# Inf/-Inf - Infinity (+/-)
# NA - missing values

# to get help, prefix the command with "?"
?iris
#or use the help function
help.search('weighted mean')

#importing data is easy. R supports many text formats
povertyDf = read.csv("./data/world_poverty_in_millions.csv")

#exporting is easy too.
write.csv(povertyDf, "./data/export.csv")

#functions are variables. they are defined like this
cube = function(x) {
    x^3
}

# control flow
isEven = function(x) {
    if (x %% 2 == 0) { TRUE }
    else { FALSE }
}

for (i in 1:10) {
    print(i)
}

i = 10
while (i > 0) {
    print(i)
    i= i-1
}

# apply is a group of map function.
apply(mat, 1, mean) # gets the mean of each row (1 means row)

#apply comes in different flavors:

lapply(vec, cube) # apply for lists and vectors
sapply(vec, cube) # returns the value as a vector (easier to use than lapply)

mapply(rep, 1:4, 4) # multivariate apply. Use this if you have a function with more than one parameter
#this is equivilant to this: matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
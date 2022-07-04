
#title: "Test Markdown"
#author: "Hassan Dahir"
#date: '2022-07-04'

# 1: Make two vectors: one named vec1 with values 1 through 6 and one named vec2 with letters A through F.
vec1 <- c(1, 2, 3, 4, 5, 6)

vec2 <- c("A", "B", "C", "D", "E", "F")


#2: Create two matrices, one from vec1 and one from vec2. The dimensions for both matrices are 3 rows by 2 columns.
mat1 <- matrix(vec1, nrow=3, ncol=2)

mat2 <- matrix(vec2, nrow=3, ncol=2)

#3: inspect the vector and matrix you crated 

#4: Make a matrix from both vec1 and vec2 with 6 rows and 2 columns. Inspect this matrix.

#a matrix compiled using two vectors: vec1 and vec2. The compiled vector is then changed to matrix
mat3 <- matrix(c(vec1, vec2), 6, 2)

#It can also be created like this
mat3b <- cbind(vec1, vec2)

#evalutae if mat3b is a matrix
boolen = is.matrix(mat3b)

#5: Make a dataframe called dat3 where vec1 and vec2 are both columns. Name the columns V1 and V2, respectively. Use function data.frame().

dat3 = data.frame(V1 = vec1, V2= vec2)

#Again, make a dataframe called dat3b where vec1 and vec2 are both columns. Name the columns V1 and V2, respectively. 
#Use function as.data.frame() on the matrix obtained from Question 4.

dat3b = as.data.frame(mat3, stringsAsFactors= TRUE)

is.numeric(dat3[, 1])

is.character(dat3b[, 1])

#Select 1) the third row, 2) the second column and 3) the intersection of these two in the dataframe dat3 that you have created in Question 4.

dat3[3, ]  #3rd row
dat3[, 2] #2nd column
dat3[3, 2] #intersection

str(dat3)

#Imagine that the first variable V1 in our dataframe dat3 is not coded correctly, but actually represents grouping information about cities. 
#Convert the variable to a factor and add the labels Utrecht, New York, London, Singapore, Rome and Cape Town.

dat3$V1 <- factor(dat3$V1, labels = c("Utrecht", "New York", "London", "Singapore", "Rome", "Capetown"))

con <- url("https://www.gerkovink.com/fundamentals/data/boys.RData")
load(con)
boys

View(boys)

#Find out the dimensions of the boys data set and inspect the first and final 6 cases in the data set.

dimension = dim(boys)
dimension

#select the first 6 raws
boys[1:6, ]


#select the first 6 raws

boys[743:748, ]

#get the head of the dataset: ie the first 6 raws of the data

head(boys)

tail(boys)

is.unsorted(boys$age)
!is.unsorted(boys$age)

#Select all boys that are older than 19, but younger than 19.5. How many are there?

boys3A <- boys[boys$age > 19 & boys$age < 19.5, ]
boys3B <- subset(boys, age > 19 & age < 19.5)

#What is the mean age of boys younger than 15 years of age that do not live in region north?
mean(boys$age[boys$age < 15 & boys$reg != "north" ], na.rm = TRUE)

mean(subset(boys, age < 15 & reg != "north" )$age, na.rm = TRUE)



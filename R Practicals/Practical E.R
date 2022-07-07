

#Create a for-loop that loops over all numbers between 0 and 10, but only prints numbers below 5.

for (var in 1:10){
  if (var < 5) {
    print(var)
  }
}

#Modify the for loop to only print the numbers 3, 4, and 5.
for (var in 1:10){
  if ((var < 6) & (var > 2)){
    print(var)
  }
}

#Try to do the same thing without a for-loop, by subsetting a vector from 0 to 10 directly.
for (var in 1:10){
  if ((var < 6) & (var > 2)){
    print(var)
  }
}
num <- 0:10
num[num < 6 & num > 2]

#Recreate the following matrix, where 1 to eight are multiplied by 1 on the first row, 
#2 on the second, etc. Tip: use byrow = TRUE to fill a matrix left-to-right instead of top-to-bottom.



mat <- matrix(1:8, ncol=8, nrow=5, byrow = TRUE)

for (i in 1:5){
  mat[i, ] <- mat[i, ] * i
}

#Create a 6 by 6 matrix of strings, where each cell contains “row + column = sum”. 
#For example, the second row, third column would yield “2 + 3 = 6”. 
#Tip: Create an empty 6x6 matrix first and fill it with values later.

string.mat <- matrix(NA, ncol = 6, nrow = 6)

for (i in 1:6) {
  for (j in 1:6) {
    string.mat[i, j] <- paste(i, "+", j, "=", i+j, sep="")
  }
}

string.mat

#Modify your loop to put "Sum > 8" in the matrix in the cells where that is true.

string.mat <- matrix(NA, ncol = 6, nrow = 6)

for (i in 1:6) {
  for (j in 1:6) {
    if (i+j <= 8) {
      
      string.mat[i, j] <- paste(i, "+", j, "=", i+j, sep="")
    } else {
      string.mat[i, j] <- "Sum > 8"
    }
    }
}

string.mat



#Author - Hassan Dahir 
#Data: 4-7-2022
#File: Practical excericise 1
#Course: Statistical-Programming-with-R



# Exercise 1 - create an object a with element (value) 1
a <- 1

# Exercise 2 - verify that 1 is stored in a
a

# Exercise 3 - square a
a^2

# Exercise 4 - create b and assign a + a. Check if b is indeed a + a. 
b <- a + a

b == a + a

# Exercise 5 - square b, multiply the answer with a divided by b and call the 
c <- b^2 * (a/b)

d <- sqrt(c^b) * (a / b^6)


# Exercise 6 - round the answer from the previous exercise to 3 decimals. 
d <- round(d, 3)

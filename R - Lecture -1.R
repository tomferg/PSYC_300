######R introduction Lecture ####

rm(list=ls()) #remove data
cat("\014")  #clears workspace

# --> comments, that means if you run the script it won't run the comments as command
#this allows you to annotate what you are doing
#text #comment here

##### links for R and R Studio #####

# https://www.r-project.org/ #R
# https://mirror.its.sfu.ca/mirror/CRAN/ #SFU mirror for R
# https://www.rstudio.com/products/rstudio/download/ #for R studio

###### R operations ######
3 #input, with no modifier this is also our output
#R can do math!
3 + 3 #this computes the sum
3 * 3 #this computes the product
#order of operations matters, R is not smart...
4+4/4 #answer is 5 (try it)
(4+4) /4  #answer is 2
4^2

#Assigning a variable
a = 4 #This creates a variable called a
a <- 4 #alt method
b = 3
d = a + b
e = (a^2) + (b^2)
sqrt(e)

##### Intro to Inputting data #####
v1 = c(1,2,3,4,5) #manually entering data, try changing the numbers or adding more
#this is known as a vector
v1 + 5 #you can modify an array/vector and this will apply to each element in the array/vector
v1 * 5
v2 = v1 * 5
v3 = v1 * v1
#there are much complex ways of inputting data, but we'll save that for next week

###### Intro to R functions ###### 
#Functions Can be anything from simple to complex
#Function is input to output. So you put something in and R outputs something
#This is where R shines, as you can create reproducible analyses and share functions via packages
#R has tons of built in functions for us to do most basic analyses
b = 4 + 3
b = sum(3,4) #this is just one example, we will go over them in more detail at a later date


help(rnorm)

##### Intro to Packages ######
install.packages("datasets") #we don't need to install datasets, as it comes with R
library(datasets) #this laods the package, 
#we can make sure got installed via the packages pane

install.packages("tidyverse") #graping and manipulating data package
library(tidyverse)
#you can also load packages manually just by clicking, but this is not as reproducible
#this is the great thing about R, is that as long as someone has your data set, if you've done everything correct
#they should be able to recreate your analysis completely just by running the code!
#Packages contain functions

##### To Do/Practice #####

#Practice 1: Input some elements called a,b & c. Multiple them together
#Practice 2: Input a vector with the numbers 10, 12, 14, 15, 18, 22
  #to do so, you'll need the command: c(#,#,#) --> fill in the numbers with your values
  #Name that vector something you'll remember
  #Multiply or divide the vector by 10. What do you notice?
#Practice 3: Create an element called 'a'
  #Input a vector with 1,2,3,a
  #What do you notice?
#Practice 4: Create a vector with element "y,z,x"
  #What do you notice?
#Practice 5: Install the package "tidyverse"
  #Load the library 
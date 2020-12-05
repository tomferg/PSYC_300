###### R Lecture 6 ######
##### Review #####
#Plot and run a correlation on the data set called "matlab" 
#what sort of correlation do you notice?
#how would your approach to this test change if informed that "matlab score" was ordinal?


##### Normal Distributions #####
#we can make a normal distribution using the rnorm function
#this is the normal distribution 
#rnorm() - has three arguements: n (samples), mean (average), and sd

rnorm(20,0,1)
rnorm(20,10,100)
#notice anything from these two distributions?
#we can also plot distributions but first we need to assign the normal to a variable
d = rnorm(20,0,1)

#what graph command do you think we'd use? Try it with both the plot() and hist() commands

#Now add a title, axis titles, and change the colour

#Let's see what happens when we change the parameters
d1 = rnorm(20,10,100)
hist(d1)

d2 = rnorm(50,0,1)
hist(d2)

d3 = rnorm(100,0,1)
hist(d3)

d4 = rnorm(10000,0,1)
hist(d4)

d5 = rnorm(100000,0,1)
hist(d5)


d6 = rnorm(100000,10,100)
hist(d6)

d7 = rnorm(100000,1,1000000)
hist(d7)

d8 = rnorm(100000,1000000,1)
hist(d8)
#What do you notice, as the number of samples goes up?
#what do you notice as the mean changes? What about the SD?


#Normally studies in psych have ~30 people (if you're doing behavioural work)
#try plotting a histogram of a normal distribution with 30 people. Does it look normal?

#A lot of the time, people assume normality in their data. But many datasets are not normal
#People assume and don't measure: skew, kurtosis, q-q plots, or test whether their
#variance is homogenous


##### Calculate z-score #####
#Let's use d5 as an example
#mean would be 0, sd would be 1
# x = 2.35
z = (2.35-0)/1
#what do you notice?

#what about if we tried one with a bit of variability
d9 = rnorm(10000,10,100)
# x = -82 or x = 100
#Try it yourself...
z = (-81-10)/100

#So this gives us our z-score, but we'd then have to go to our z table to figure
#out what ...or maybe not?
#we can use the pnorm() command. It just needs your: X, mean, and SD
pnorm(-82,10,100)
pnorm(100,10,100)
#Can you tell which part of the curve it is giving you?
#It's easier if you visualize it...try that now
hist(d9)

#Try to compute z-scores for each of the following numbers:
# x = 34, mean = 10, sd = 10
# x = -25, mean = 10, sd = 10
# x = 500, mean = 450, sd = 100
# x = -29, mean = 50, sd = 5
#For each of these z-scores, compute the area to the right and the area to the left.

#Try to find and examine what other distributions in r look like
#for example try to find (and plot) a binomial distribution. 
#play around with the parameters.
#Do the same with an exponential distribution. Also try plot vs hist
#finally play with a poisson distribution


###### Significance Test ######
#Z-test in R is a bit more involved...
#If we were testing the significance where x= 60
#our mean = 90, and sd = 10.2

#We can first define our cut off regions using the formula: x = mean +/- z(sd)
#Our cutoff for the z-test would be 1.96
x1 = 90 + (1.96*10.2)
x2 = 90 - (1.96*10.2)

#Then calculate our z-score
z = (60-90)/10.2
pnorm(60,90,10.2)
#And unfortuantely that's as far as we can go without a function or an outside package
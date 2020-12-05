# R - Lecture 5 - Correlation and Regression #
##### Graphing Review and Notes #####

my_data = read.table(file.choose(), header = T) #read the data in
View(my_data) #make sure the data looks reasonable

#Method 1
plot(my_data$Height,my_data$Age) #using the $ you can tell R to look in a mounted data frame
#and look for the column "Height" or "Age"

#Method 2
attach(my_data) #attach the data
#the attach function allows you to work with the 
plot(Height,Age)


##### Correlation #####
#Doing a correlation in R is easy
my_data1 = read.csv(file.choose(), header = T) #read the data in...notice anything different?
#Hint: always be careful about your file type or format
View(my_data1)
plot(my_data1$X,my_data1$Y)


#Review Time!
#Try to add a title and x and y axis labels
#change the dot types
#change the type to a line

#Let's add a correlation line
abline(lm(my_data1$Y~my_data1$X), col="red")

#Short Way
#Use the cor() command. Simple but...
cor(my_data1) #this will return correlations across the entire dataset
cor(my_data1$X,my_data1$Y) #this isolates the correlation of interest
#So if you have a more complicated dataset you'll want to use the second method (unless you want tons of correlations output)

#We can also specify the type
cor(my_data1$X,my_data1$Y, method = "pearson") #pearson, when you have cts X and Y
cor(my_data1$X,my_data1$Y, method = "spearman") #spearman when you are working with non-para, or ordinal data
#Note the different values...

#We can also verify this a longer way....
#First we'll need to compute the covariance
#Compute our two means
avg_x = mean(my_data1$X)
avg_y = mean(my_data1$Y)
#compute our SD
sd_x = sd(my_data1$X)
sd_y = sd(my_data1$Y)

#Compute the diff between x and mean of x
my_data1$diffX = my_data1$X-avg_x 
sum(my_data1$diffX) #notice anything?

#Now you try computing the diff between y and mean of y

#Then create a column multiplying the two of them...any idea how?

#After that it's easy! Creat a variable called cov (your covariance)
#you'll need to use the ncol command here...it counts the number of your columns
#you could also just eyeball it, but it's better practice to not do so

correl_data1 = cov/(sd_x*sd_y)
correl_data1
#notice anything? wonder why there is a difference?


##### Regression (sort of...I'll probably intro more of this next week as it's complex) #####
#we use the lm command here (linear model) lm()

linear_model = lm(my_data1$Y ~ my_data1$X)
print(linear_model) #this gives us the intercept and the slope
summary(linear_model)


# To Do
#correlate this data: http://users.stat.ufl.edu/~winner/data/lsd.dat
#hint: read.table(website,header=F)

#Plot the data data first. Add a title, anc change the colour of the line

#What do you notice about the size of it?
#add a correlation line with abline()



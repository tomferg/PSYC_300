####### Lecture 3 ######
#A lot of this will be just covering the conclusion of lecture 2
#and a slight introduction to some concepts from class

my_data_header = read.table("/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master/IQ_Table_header.txt",header=T, sep ="\t")
View(my_data_header)
summary(my_data_header)
#We could import it with a header, as I've done here
#If data has a header we add "header = T" arguement

#Or we could add it in with the names or colnames command
names(my_data) <- c("IQ","Freq","Rel. Freq", "Cum. Freq")
View(my_data)
colnames(my_data) <- c("IQ_col","Freq_col","Rel. Freq_col", "Cum. Freq_col")
View(my_data)
#we would want to use col names just to help us specify, as we could also re-name the rows
#Question: What category of data is this?

#Another example, this time with space
my_data_2 = read.table("/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master/Memory_Table.txt",header=T,sep=",")
View(my_data_2)
#Data can be sorted...nice thing about R
#What are the types of data shown here?
#Why?

#Can also just manually choose. Not as reproducible but useful when you're analysing a different datasets
my_data = read.table(file.choose())

#Intro to read.csv
#CSV is very similar but we use CSV files instead
#In fact, read.csv is just a specified form of read table
#You can use both, but I think mostly in this class we will be working with text files

#### Intro to tidy data ####
#each variable should be a column
#each observation should be a row
#each type of observation unit is a table
#People teach whole courses on this, so I won't go into too much detail today
#Suffice to say, it matters and being comfortable with tidy data and being able to recognize is helpful
# Example links: 
# http://www.statisticalconsultants.co.nz/services/statistical-programming-services.html - untidy
# http://garrettgman.github.io/images/tidy-4.png - tidy


###### Calculating mean/median/mode #####
#Let's say we had some data
sample_data = c(1,2,3,4,5,3,2,4,2,3,4,5,1,10)
#It's very easy to calculate the mean and the median
mean(sample_data)
median(sample_data)
#However, the mode is not so easy. R does not have a built in calculator for it.
#it requires writing a function for this...which is probably a bit too advanced for today

#Question, what would happen if we added a "na" to our dataset?
sample_data_2 = c(1,2,3,4,5,3,2,4,2,3,4,5,1,10,NA)
#Try to calculate the mean and median in this case
#What happens?

#If we add the na.rm arguement however, we can work with it
mean(sample_data_2, na.rm = TRUE)
median(sample_data_2, na.rm = TRUE)
#How could we do thids with a dataset? (covered in more detail in lecture 4)
my_data = read.table("/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master/Speech_Table.txt",header=T,sep=",")
View(my_data)
#Notice the column names...this is the key
mean(my_data$speech_score) #the $ operator tells R to look in my_data at the speech_score column
median(my_data$speech_score) #can do it with median as well


###### Distribution examples #######
#this is just review from class
#What do all these distributions look like?
hist(rbeta(10000,10,10))
hist(rbeta(10000,10,3))
hist(rbeta(10000,3,10))


##### Practice #####
#From lectures 1 and 2

#Input some elements called a,b & c. Multiple them together
#Input a vector with the numbers 10, 12, 14, 15, 18, 22
  #to do so, you'll need the command: c(#,#,#) --> fill in the numbers with your values
  #Name that vector something you'll remember
  #Multiply or divide the vector by 10. What do you notice?
#Create an element called 'a'
  #Input a vector with 1,2,3,a
  #What do you notice?
#Create a vector with element "y,z,x"
  #What do you notice?
#Install the package "tidyverse"
  #Load the library 


#read table with no headers for the following url
# http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat

#Create a folder on your desktop and change your directory to that folder
    #download the sample file from coursespaces called "Class_Table.txt" and put it in that folder
    #Try to import the sample file uploaded to coursespaces - it's seperator is comma
    #what happens if you try different seperators?
#change the header names to something else
    #What type of data are the three columns?
#Manually sort the data by class. Do you see any trends?

#Advanced practice: Try to see if you can calculate the mean test score for test 1
#Either do it by hand or via R if you're feeling capable
#Calculate the median as well
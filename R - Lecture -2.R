# Lecture 2
#### #Directories #####

#What directory you use is important 
getwd() #this gets your working directory, tells you were R is looking. We can change this via setwd()
setwd("/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master") #this sets your working directory

#These two functions basically point your computer to a certain place
#This can be used for organization, and I would recommend it
#You can see what files you are working with and what their names are. It functions sort of like 
#explore/finder but is self-contained within R studio
#You can also create projects - which i won't talk about - for keeping your workspace clean

#To save your workspace
save.image() #this just saves all your variables. R studio normally asks you though, so this isn't neccesary


###### Inputting Data   ######
#Data can be input manually
a = 3 #element wise
b = c(1,2,3,4,5) #vector-wise
#This is a lot of work however...
 
#However, R really shines when you use its built in commands to add datasets
read.table() #reads data in table format
read.csv() #reads in text files or csv files


#Intro to read.table
#Online
read.table("http://lib.stat.cmu.edu/jcgs/tu",skip=4,header=T) #import from web
#but in order to do anything with this, we'll want to assign it!
new.t = read.table("http://lib.stat.cmu.edu/jcgs/tu",skip=4,header=T)
View(new.t) #lets you view the table
head(new.t) #lets you see the top of the table
summary(new.t) #gives you some summary statistics of the 7 columns

#Via text files
#import from desktop (on course spaces)
my_data = read.table("/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master/IQ_Table.txt",header=F, sep ="\t")
#the seperator is "tab" in this case. But it could also just be "space" or a ","
View(my_data)
#This is confusing, it might be useful if we had a header to tell us what the data mean...

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
my_data_2 = read.table("C:/Users/thomasferguson/Sync/300a/Fall 2018/R_Tutorial_300A-master/Memory_Table.txt",header=T,sep=",")
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



##### Practice #####
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
#Either do it by hand or via R if you're feeling 

#PSYC 300B - Script for Project Analysis
#Coded by: Tom Ferguson, January 2020
#Most recent update: February 29th, 2020

### Install and Load Packages ###
#"car" is needed for levene's test
#"DescTools" is needed for Dunnett's test
#"psych" isn't needed, but makes our life easier by outputing descriptive statistics 
#First, we install our packages
install.packages("car")
install.packages("DescTools")
install.packages("psych")
#Then we need to load the packages - this just basically turns them on
library(car)
library(DescTools)
library(psych)
#then we want to check our R version - psych only works with r version later than 3.3
version #Check R version, your major should be 3 and your minor should be 6.2 (or 6.3)

### Loading Data ###
Data_300B = read.csv(file.choose(),header=TRUE) #this allows us to select our csv datafile
View(Data_300B) #this lets you see your data. it will pop up in another tab

#Data formatting for the ANOVA & Levene's Test
#this just makes sure R knows which variables are factors and which are numbers
Data_300B$Gender = as.factor(Data_300B$Gender) #tells R studio that your Gender variable is a factor
Data_300B$ï..Group = as.factor(Data_300B$ï..Group) #tells R studio that your Group variable is a factor
Data_300B$Data = as.numeric(Data_300B$Data) #tells R studio that your Data variable (your DV) is a number 

### Descriptive Statistics - For the Age of your Genders
males = subset(Data_300B,Gender==1)
females = subset(Data_300B, Gender == 2)
transgender = subset(Data_300B,Gender == 3)
#Note: If you have no transgender participants then this last command doesn't need to be ran.
#I did not have any in this sample dataset

#Describe Data - this provides descriptive statistics (like SPSS does)
#For these we want to look at the "mean" and "sd" for Age - that is our mean and standard deviation
describe(males)
describe(females)
describe(transgender) #this will not work if you do not have any transgender participants

### Descriptive Statistics - for your Conditional Means
#this just subsets your conditions into the 4 groups
#To make sure this is working check the variable in the environment
#It should say "10 obs. of 4 variables"
condition1 = subset(Data_300B,ï..Group==1)
condition2 = subset(Data_300B,ï..Group==2)
condition3 = subset(Data_300B,ï..Group==3)
condition4 = subset(Data_300B,ï..Group==4)

#Describe Data - this provides descriptive statistics (like SPSS)
#For these we want to look at the "mean" and "sd" for Data - that is our mean and standard deviation
#of our DV by each condition
describe(condition1)
describe(condition2)
describe(condition3)
describe(condition4)

### Levene's Test ###
leveneTest(Data_300B$Data,Data_300B$ï..Group) #This runs our Levene test

### ANOVA ###
anova = aov(Data ~ ï..Group, data=Data_300B) #this runs the ANOVA
summary(anova) #this provides our ANOVA table
MSE = summary(anova)[[1]][["Mean Sq"]][[2]] #Extracts out the MSE for our Post-Hoc tests

### Post Hocs ###
### Tukey's Test
#Our tukey critical values are: 3.8088 (.05) & 4.7295 (.01)
Tukey05 = 3.8088*sqrt((MSE)/10) #tukey values for .05
Tukey01 = 4.7295*sqrt((MSE)/10) #tukey value for .01
Tukey05
Tukey01
TukeyHSD(x=anova, 'ï..Group', conf.level=0.95) #Runs the actual Tukey HSD test

### Dunnett's Test ###
#Our tukey critical values are: 2.4521 (.05) & 3.1116 (.01)
Dunnett05 = 2.4521*sqrt((2*MSE)/10) #t-dunnet  value for .05
Dunnett01 = 3.1116*sqrt((2*MSE)/10) #t-dunnet value for .01
Dunnett05
Dunnett01
DunnettTest(Data_300B$Data,Data_300B$ï..Group) #Runs the actual Dunnett test
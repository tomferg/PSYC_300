#PSYC 300B - Script for Project Analysis
#Coded by: Tom Ferguson, January 2020
#Most recent update: February 29th, 2020

### Install and Load Packages ###
#We only need one package for this assignemnt - the car package
#This allows us to do Levene's test
install.packages("car")
install.packages("DescTools")
library(car)
library(DescTools)
version #Check R version, your major should be 3 and your minor should be 6.3

### Loading Data ###
Data_300B = read.csv("C:/Users/Thomas Ferguson/Desktop/300B_Project/Ferguson_300Bdata.csv",header=TRUE)
#Note: the quotes and the forward slashes! For Mac you'll need to remove the C:
#this is what you'll need to modify...think of this as telling R-studio for where to look on your computer
#You will need to re-name it to your CSV files name and point it to where that file is on your computer

View(Data_300B) #this lets you see your data. it will pop up in another tab in the script tab

#Data formatting for the ANOVA
#this just makes sure R knows which variables are factors and which are numbers
Data_300B$Gender = as.factor(Data_300B$Gender) #tells R studio that you Gender variable is a factor
Data_300B$ï..Group = as.factor(Data_300B$ï..Group) #tells R studio that you Group variable is a factor
Data_300B$Data = as.numeric(Data_300B$Data) #tells R studio that you Data variable (your DV) is a number 

### Descriptive Statistics - For the Age of your Genders
males = subset(Data_300B,Gender==1)
females = subset(Data_300B, Gender == 2)
transgender = subset(Data_300B,Gender == 3)
#Note: If you have no transgender participants then this last command doesn't need to be ran.
#We do not have any in this sample dataset

#Mean for each group
mean(males$Age)
mean(females$Age)
mean(transgender$Age) #Doesn't work in this case!
#Standard Deviation for each group
sd(males$Age)
sd(females$Age)
sd(transgender$Age) #Doesn't work in this case!

### Descriptive Statistics - for your Conditional Means
#this just subsets your conditions into the 4 groups
#To make sure this is working check the variable in the environment
#It should say "10 obs. of 4 variables"
condition1 = subset(Data_300B,ï..Group==1)
condition2 = subset(Data_300B, ï..Group == 2)
condition3 = subset(Data_300B,ï..Group == 3)
condition4 = subset(Data_300B,ï..Group == 3)

#Mean for each group
mean(condition1$Data)
mean(condition2$Data)
mean(condition3$Data)
mean(condition4$Data)
#Standard Deviation of each group
sd(condition1$Data)
sd(condition2$Data)
sd(condition3$Data)
sd(condition4$Data)

### Levene's Test ###
leveneTest(Data_300B$Data,Data_300B$ï..Group)

### ANOVA ###
anova = aov(Data ~ ï..Group, data=Data_300B)
summary(anova)
MSE = summary(anova)[[1]][["Mean Sq"]][[2]] #Extracts out the MSE for our Post-Hocs

### Post Hocs ###
### Tukey's Test
#Our tukey critical values are: 3.8140 (.05) & 4.7393 (.01)
Tukey05 = 3.8140*sqrt((MSE)/10)
Tukey01 = 4.7393*sqrt((MSE)/10)
Tukey05
Tukey01
posthoc <- TukeyHSD(x=anova, 'ï..Group', conf.level=0.95) #Runs the actual test
posthoc

#### Dunnett's Test
#Our tukey critical values are: 2.4552 (.05) & 3.1175 (.01)
Dunnett05 = 2.4552*sqrt((2*MSE)/10)
Dunnett01 = 3.1175*sqrt((2*MSE)/10)
Dunnett05
Dunnett01
DunnettTest(Data_300B$Data,Data_300B$ï..Group)

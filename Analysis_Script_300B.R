# Analysis for 300B Project
#Packages
#install.packages("tidyverse")
#install.packages("car")
library(tidyverse)
library(car)

#Load Data
Proj_data = read.csv("/Users/thomasferguson/Sync/300B/Spring 2019/Sample_Project.csv",
                      header = T,sep=",")
#Summary Statistics
proj_summary = Proj_data %>% group_by(Condition) %>% summarize(RT_mean = mean(RT))
proj_summary

#ANOVA (using aov)
anova_project = aov(RT ~ Condition, data=Proj_data)
summary(anova_project)

#Levene's Test
leveneTest(RT ~ Condition, data = Proj_data)

#Post-Hocs
#Tukey's
postHoc <- TukeyHSD(anova_project)
postHoc
plot(postHoc)

#Dunnette's (not sure if possible)



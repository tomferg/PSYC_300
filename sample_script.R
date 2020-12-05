#Sample analysis for ANOVA t

#Load data
fake_data = read.csv("/Users/thomasferguson/Desktop/sample_data.csv",header=TRUE,sep=",")

#Factor
fake_data$Group = factor(fake_data$Group)

#Run the ANOVA
one_way = aov(Control ~ Group, data=fake_data) #does an anova of the data, one-way anova
summary(one_way)

#Follow up tests/Post Hocs
pairwise.t.test(fake_data$Control, fake_data$Group, p.adj = "bonf")
TukeyHSD(one_way)

#Plot the data

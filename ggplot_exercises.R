install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")
library("ggplot2")
# have to install once but reload each new script
library("plyr")
library("ggthemes")
library("reshape2")
head(iris)
iris[1:2, ]
df <-melt(iris, id.vars = "Species")
df[1:2, ]
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)
ggplot(data =iris, aes(x = Sepal.Length, y = Sepal.Width, color=Species)) + geom_point(size = 3)
# Why aes(shape = Species)?
# Make a small sample of the diamonds dataset
# subset randomly 100 points out of diamonds dataset
head(diamonds)
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
summary(d2)
ggplot(data=d2, aes(x=carat, y=price, color=color)) + geom_point()
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
# whats going on under the hood
myplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(myplot)
#Faceting: single column, multiple rows
ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) + geom_point() + facet_grid(Species ~.)
#faceting: multiple column, single row
ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) + geom_point() + facet_grid(.~ Species)
# or just weap our facets
ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) + geom_point() + facet_wrap(~ Species) # notice lack of
aes(color=variable) # mapping
color="black" #setting
#or add it as a scale
scale_fill_manual(values=c("color1", "color2"))
library(RColorBrewer) # Cool colors
display.brewer.all()
df <-melt(iris, id.vars="Species")
ggplot(df, aes(Species, value, fill=variable)) +
  geom_bar(stat="identity", position="dodge") +
  scale_fill_brewer(palette="Set1")
gglot(birthwt, aes(factor(race), bwt)) +
  geom_boxplot(width=.2) +
  scale_y_continuous(labels) #??? didn't finish
h <- ggplot(faithful, aes(x=waiting))
h + geom_histogram(binwidth=30, colour="black")
h + geom_histogram(binwidth=8, fill="steelblue", colour="black")
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat="identity")
ggplot(df, aes(Species, value, fill=variable)) + 
  geom_bar(stat="identity", position="dodge")
ggplot(d2, aes(x=clarity, fill=cut)) + geom_bar(stat="bin", position="dodge")
ggplot(faithful, aes(waiting)) + 
  geom_density(fill="blue", alpha=0.1)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=3) +
  geom_smooth(method="lm")
install.packages(ggthemes)
library(ggthemes)
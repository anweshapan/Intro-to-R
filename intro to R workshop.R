### Anwesha Pan
### 07/19/2018
### Intro to R studio workshop 


##set working directory 
setwd("//netid.washington.edu/csde/other/desktop/anweshap/Desktop")



install.packages("uwIntroStats")
library(uwIntroStats)


# Using R as a calculator
2 + 3
2 / 3

# assign the number 3 to object called abc
abc <- 10
# print contents
abc

# specifying arguments by name
seq(from=1, to=5, by=1)

# create a vector
first_vec <- c(1, 3, 5)
first_vec
# create vector
##Vectors##
colors <- c('red', 'green', 'blue')
colors

# Generating list 
# creating a list of a numeric vector, an integer vector, and a character vector
mylist <- list(1.1, c(1,3,7), c("abc", "def"))
mylist

### Creating the list to store the information about three books from bookshelf

mylist2 <- list(Argumantative_Indians=c("Amartya Sen", "2005", "432", "Indian culture"), 
             Poor_Economics=c("Abhijit V. Banerjee", "2011", "320", "Global poverty"), 
             The_Fountainhead=c("Ayn rand", "1947", "704", "Objectivism philosophy")) 
mylist2


## Creating matrices
# create a 2x3 matrix, filling down columns
a <- matrix(1:6, nrow=2)
a
b <- matrix(5:14, nrow=2)
b
b1 <- matrix(5:14, nrow=2, byrow=TRUE)
b1
# generating 5x4 numeric matrix 
y<-matrix(1:20, nrow=5,ncol=4)
y


## creating data frame 
mydata <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age    = c(42,38,26)
  )
mydata



# Some useful Functions

length(object) # number of elements or components
str(object)    # structure of an object 
class(object)  # class or type of an object
names(object)  # names

c(object,object,...)       # combine objects into a vector
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows 

object     # prints the object

ls()       # list current objects
rm(object) # delete an object

newobject <- edit(object) # edit copy and save as newobject 

## Let's see how it works 
length(mydata)
str(mydata)
class(mydata)
names(mydata)

# list all objects in current session
ls()

# Delete "mylist" from the session 

rm(mylist)

# Now again list all objects in current session 
ls()




##Importing "bodyfat" file 
bodyfat <- read.csv("//netid.washington.edu/csde/other/desktop/anweshap/Desktop/bodyfat.csv", header=TRUE)

attach(bodyfat)
View(bodyfat)

## Glancing at "bodyfat" 
#Lets you look at the first few rows
head(bodyfat) 
head(bodyfat, 10)
#Lets you look at the last few rows
tail(bodyfat) 
tail(bodyfat, 10) 
#Lets you look at variable names
colnames(bodyfat) 

## Exploring continuous variables numerically

summary(bodyfat)

mean(age)
mean(weight)

median(age)

summary(age)
summary(weight)
summary(neckcircum)

#Calculates the Square Root of weight for each observation
sqrt(weight)

#Calculates e raised of weight for each observation 
exp(weight)

#Calculates the logarithm of weight for each observation 
log(weight)


## Plotting the basic graphs 

## Let's create a barplot 
## Creating a categorical variable for age (categories are <=40, (40, 50], > 50)
agectg <- cut(age, c(min(age), 40, 50, max(age)), include.lowest=TRUE)

## make the table for each category 
table(agectg)

## barplot for a categorical variable: this uses counts per category
barplot(table(agectg), main="Barplot of Age")

## Now let's create a histogram 
hist(weight)
hist(abdomencircum)

## Create a boxplot 
boxplot(weight)

boxplot(weight ~ agectg, main="Weight by age", ylab="weight")

## Create a scatterplot 
plot(weight, age, main="weight by age", xlab="age", ylab="weight")


## Simple linear regression 
regress(fnctl = "mean", formula = weight ~ age)



## Test about proportions with two independent samples
## using tabulated data
tab <- matrix(c(26, 6, 24, 5), nrow=2, ncol=2, byrow=TRUE)

## let's see the result
tab

chisq.test(tab)
fisher.test(tab)

#Analysis of Variance (ANOVA)#
fit <- aov(weight ~ age)
fit


#  More Help

# 1. http://cran.r-project.org/
# 2. Come in and talk to any of the Consultants
# 3. CSSS courses 
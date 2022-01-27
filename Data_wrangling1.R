### Anwesha Pan
### 01/27/2022
### Data Wrangling in R


##set working directory 
setwd("//netid.washington.edu/csde/other/desktop/anweshap/Desktop")


## Installing R packages 
library(dplyr) 
library(tidyr)

##Importing "bodyfat" file 
bodyfat <- read.csv("//netid.washington.edu/csde/other/desktop/anweshap/Desktop/bodyfat.csv", header=TRUE)


## Key functions in dplyr
## a)`%>%` is the pipe operator: input into the next function
## the pipe operator allows us to chain together dplyr data wrangling functions
## pipe operator can be read as "then"
## pipe operator allows us to go from one step in dplyr to the next 

## b) group_by() helps to break into subsets
## c) filter() selects rows based on column values
## d) arrange() changes the order of the rows.
## e) select() changes whether or not a column is included.
## f) mutate() changes the values of columns and creates new columns.
## g) summarize() create summary statistics




### dplyr` allows us to use pipe operators (`%>%`) to "pipe" data between functions.

mean(bodyfat$weight)
bodyfat$weight %>% mean()

log(mean(bodyfat$weight))
bodyfat$weight %>% mean() %>% log()

### using filter
bodyfat1a <- bodyfat %>%
  filter(weight  > 200)
head(bodyfat1a)

### using select 
bodyfat1b <- bodyfat %>%
  select(case, age, height, weight)
head(bodyfat1b)

### using filter and select 
bodyfat2 <- bodyfat %>%
  filter(weight >200) %>%
  select(case, age, height, weight)
head(bodyfat2)

### drop some variables using select 
bodyfat3 <- bodyfat %>% 
  select(-age, -height, -weight)
head(bodyfat3)


### Arranging the variables 
arrange1 <- bodyfat %>% 
  arrange(weight)
head(arrange1)

### arrange in descending order
arrange2 <- bodyfat %>% 
  arrange(desc(weight))
head(arrange2)


### using mutate and create a new column
### we are converting height from inches to feet 
mutate1 <- bodyfat %>%
  mutate(height_ft = height/ 12)
head(mutate1)

### mutate and make categories
category1 <- bodyfat %>% 
  mutate(age_ordinl = case_when(
    age < 40 ~ "group1",
    age >= 40 ~ "group2")) 
head(category1)

### mutate, select age and make the categories 
category2 <- bodyfat %>% 
  select(age) %>% 
  mutate(age_ordinl = case_when(
    age < 40 ~ "group1",
    age >= 40 ~ "group2")) 
head(category2)


### Summary statistics 
### summarize mean and std dev of age 
summary_age <- bodyfat %>%
  summarize(mean_age = mean(age),
  std_dev = sd(age))
summary_age

### summarize mean and std dev of age of two groups we created in category1
### we are using group_by and summarize 
summary_age_gr <- category1 %>% 
  group_by(age_ordinl) %>% 
  summarize(mean = mean(age), 
            std_dev = sd(age))
summary_age_gr
 


### Now we will make a dataframe and will see how to manage long and wide format of data
### first make a dataframe
### 'tibble' constructs a dataframe 
df1 <- 
  tibble(Program = c("Engineering", "Arts & Sciences",
                     "Public Health", "Other"),
         Female  = c(50, 48, 70, 53),
         Male    = c(74, 60, 72, 55))
print(df1)

### reshaping data using pivot longer 
### lengthens data, increasing the number of rows
df1_long <- df1 %>%
  pivot_longer(-Program, names_to="Gender", values_to="Count")
df1_long 

### reshaping data using pivot wider
### widens data, increasing the number of columns
df1_wide1 <- df1_long %>%
  pivot_wider(names_from="Gender", values_from="Count")
df1_wide1

### reshaping data using unite
### Convenience function to paste together multiple columns into one.
df1 %>%
  unite(Prog_female, Program:Female, remove = FALSE)


#  More Help

# 1. http://cran.r-project.org/
# 2. Come in and talk to any of the Consultants
# 3. CSSS courses 
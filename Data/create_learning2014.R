# Seppo Eskola 13.11.2022
# Week 2 exercises
# Part 1: Data wrangling

library(tidyverse)



## Task 2 

# Read the given .txt file into R and save it as "lrn14"
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Examining the dimensions and structure of the data frame
dim(lrn14)
str(lrn14)

# The data has 80 columns and 183 rows. The cells have values from 1 to 5 except in the last four columns.



## Task 3

# Scale the Attitude column by creating column "attitude"
lrn14$attitude <- lrn14$Attitude / 10


# Creating the columns "deep", "stra", "surf"


# Access the dplyr library
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning 
deep_columns <- select(lrn14, one_of(deep_questions))
# and create column 'deep' by averaging
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning 
surface_columns <- select(lrn14, one_of(surface_questions))
# and create column 'surf' by averaging
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning 
strategic_columns <- select(lrn14, one_of(strategic_questions))
# and create column 'stra' by averaging
lrn14$stra <- rowMeans(strategic_columns)


# Create a new data set "Learning2014" by including only select columns


# choose new columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

# see the structure of the new dataset
str(learning2014)


# Correcting the names of the columns to lower case


# print out the column names of the data
colnames(learning2014)

# change the name of the second column
colnames(learning2014)[2] <- "age"

# change the name of "Points" to "points"
colnames(learning2014)[7] <- "points"

# print out the new column names of the data
colnames(learning2014)


# select rows where points is greater than zero
learning2014 <- filter(learning2014, points > 0)

# see the structure of the new dataset
str(learning2014)



## Task 4

# write a csv file of the new data

write.csv(learning2014, file="data/learning2014v1.csv", sep = ",", row.names = FALSE)

# Read the file

read.csv("data/learning2014v1.csv")

# Read previously wrangled data into an R object

learning2014_wrangled <- read.table("data/learning2014v1.csv", sep=",", header=TRUE)

# Confirm structure of wrangled data
str(learning2014_wrangled)
# Result "166 obs. of  7 variables" as it should

# Check the beginning of the data
head(learning2014_wrangled)
# appears correct (correct headers and first data rows)

# End of wrangling




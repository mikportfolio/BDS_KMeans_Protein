# BDS_KMeans_Protein
To create cluster models using K-Means algorithm

---
title: "BDS_KMeans_Protein"
author: "Ahmad Mudrik"
date: "2024-10-29"
output: html_document
---

# Protein Consumption K-Means Model

Introduction

Data set showcases protein consumption from 25 European countries. The data includes protein consumption (in grams per person per day) for red Meat, white meat, eggs, milk, fish, cereal, starch, nuts, and fruits and vegetables. This study aims to illustrate the procedure of clustering using KMeans mehod, and varying value of "K" and "nstart".

Hypothesis

1. The dietary composition of countries within the same region or culture tends to be similar.

Objective

1. To build a 3-Means clustering model
2. To build a 5-Means clustering model


## Import, inspect, and standardize data set

### Import and inspect data set
```{r}
food <- read.csv("C:\\Users\\mudrik\\Documents\\Rstudio Projects\\BDS_KMeans_Protein\\protein.csv", row.names=1) # 1st column is country name
head(food)
```
To fit K-Means into R, data needs to be transformed int a numeric matrix "x". Therefore, an factors (in this case, food$Country) needs to be expanded into dummy variables, by using "row.names()"  function when importing the data.

### Scale data for standardization
```{r cars}
xfood <- scale(food) 
```
Units used in the data are converted from "in grams per person per day" to units of standard deviation (sd). This minimizes the squared errors across dimensions of x..


## Study 1: 3-Means Model

```{r pressure, echo=FALSE}
grpMeat <- kmeans(xfood,  centers=3, nstart=10)
plot(xfood[,"RedMeat"], 
     xfood[,"WhiteMeat"], 
     xlim=c(-2,2.75), 
     type="n", 
     xlab="Red Meat", 
     ylab="White Meat", 
     bty="n")
text(xfood[,"RedMeat"], 
     xfood[,"WhiteMeat"], 
     labels=rownames(food),
     col=rainbow(3)[grpMeat$cluster])
```


### Findings from Study 1
To fit 3-Mean model to the protein data

- Takes argument "center" to define K
- "nstart" to determine number of repeats of the algorithm (each corresponding to different random start)
- The minimum deviance found across "nstart" runs is reported to the user


## Study 2: 5-Means Model

```{r}
grpProtein <- kmeans(xfood, centers=5, nstart=50)

plot(xfood[,"RedMeat"], 
     xfood[,"WhiteMeat"], 
     xlim=c(-2,2.75), 
     type="n", 
     xlab="Red Meat", 
     ylab="White Meat", 
     bty="n")
text(xfood[,"RedMeat"], 
     xfood[,"WhiteMeat"], 
     labels=rownames(food), 
     col=rainbow(7)[grpProtein$cluster]) 
```

### Findings from Study 2

- Clustering was conducted on all nine proteins, focusing on comparisons between red and white meat.
- The clustering revealed many familiar cultural and geographic groupings, identified solely through protein consumption patterns.


## Study 3: 5-Means Model

```{r}
grpProtein <- kmeans(xfood, centers=4, nstart=35)

plot(xfood[,"RedMeat"], 
     xfood[,"Fish"], 
     xlim=c(-2,2.75), 
     type="n", 
     xlab="Red Meat", 
     ylab="Fish")
text(xfood[,"RedMeat"], 
     xfood[,"Fish"], 
     labels=rownames(food), 
     col=rainbow(7)[grpProtein$cluster]) 
```

### Findings from Study 3

- The selection of the "k" value is highly subjective; algorithms that automatically determine "k" can be sensitive to assumptions regarding component probability models.
- To achieve relatively homogeneous groups, it is advisable to employ a trial-and-error approach when selecting the "k" value, ultimately choosing the one that produces the most sensible clusters.

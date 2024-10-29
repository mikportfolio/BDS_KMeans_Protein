# Title : KMeans_Protein
# Problem Statement: To evaluate 
# By: mikportfolio, 241029 1345PM


# Import and inspect data set
food <- read.csv("C:\\Users\\mudrik\\Documents\\Rstudio Projects\\BDS_KMeans_Protein\\protein.csv", row.names=1) # 1st column is country name
head(food)
table(food$Country)

# Scale the data for standardization
xfood <- scale(food) 


################
## Study 01   ##
################
# To fit 3-Mean model to the protein data, RedMeat vs. WhiteMeat

grpMeat <- kmeans(xfood,  centers=3, nstart=10)
# Takes argument "centre" to define K
# "nstart" to determine number of repeats of the algorithm (each corresponding to different random start)
# The minimum deviance found across "nstart" runs is eported to the user

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


################
## Study 02   ##
################
# To fit 7-Mean model to the protein data, RedMeat vs. WhiteMeat

grpProtein <- kmeans(xfood, centers=7, nstart=50)
grpProtein

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

################
## Study 03   ##
################
# To fit 7-Mean model to the protein data, RedMeat vs. Fish

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



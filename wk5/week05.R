# Class 05 Data Visualization 

# This is the "base" R plot 
plot(cars)

# We are going to get a new plotting package called ggplot2
# ggplot(cars)

# install.packages("ggplot2")
# Now we need to call/load the package 
library(ggplot2)

# This sets up the plot 
ggplot(cars)

gg <- ggplot(data=cars) + aes(x=dist, y=speed) + geom_point()
gg
# One last thing. Let's add a line to the data

# I want a linear model 
gg + geom_smooth(method="lm", se=FALSE)

# Add labs() and theme_bw()
gg + labs(title="Speed and Stopping Distances of Cars",
          x="Speed (mph)", y="Distance (ft)",
          subtitle = "The stopping distance of cars increase as speed increases",
          caption="Dataset: 'cars'") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()

# Read the data into R 
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# How many genes are in data set
nrow(genes)

# How many columns are there 
colnames(genes)
ncol(genes)

# How many "up" regulated genes are there 
table(genes$State)

# What fraction of total genes is up-regulated in this data set 
round( table(genes$State)/nrow(genes) * 100, 2 )

# I want to plot this result 
ggplot(genes) + 
  aes(x=Condition1, y=Condition2) +
  geom_point()

# Add some color to denote up/down values  
p <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, color=State) +
  geom_point()

# Add better color 
p + scale_colour_manual( values=c("blue","gray","red") )

# Adding plot annotations 
p + scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")

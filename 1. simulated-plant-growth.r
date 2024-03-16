## This sample code creates simulated data for plant growth,
## and plots it using ggplot2.

# 1. load the installed package
library(ggplot2)

# 2. create simulated data
set.seed(123) #this is a random number generator
num_timepoints <- 10 #this creates 10 timepoints
num_species <- 3 #this creates 3 species of plants

#3. define then combine the timepoints and species together in a single chart (variable)
#so we can do analysis on it later
time <- rep(1:num_timepoints, each=num_species) #create from 1 to 10 (i.e. 10) timepoints for each species (i.e. 10 x 3 = 30 timepoints total in the chart)
species <- rep(letters[1:num_species], times=num_timepoints)#create 10 letters to name our species
growth_rate <- c(1.2, 1.5, 1.8) + rnorm(num_timepoints*num_species, sd=0.2) #create simulated growth rates with a bit of noise in the data, like as if it was real data

#add the two lines, species and time, into a single chart
data <- data.frame(Time = time, Species = species, GrowthRate = growth_rate)
#you can check how this chart looks using the environment tab on the RHS of RStudio

#4. plot growth rates over time using ggplot2
ggplot(data, aes(x = Time, y = GrowthRate, color = Species)) +
  geom_line() +
  geom_point() +
  labs(title = "Plant Growth Rates Over Time",
       x = "Time",
       y = "Growth Rate",
       color = "Species") +
  theme_minimal()
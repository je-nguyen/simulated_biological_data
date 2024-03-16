#Using plain R with no packages to show bacterial cell growth (logistic
#as it will run out of growth medium in a petri dish, and growth will
#plateau) alongside cytotoxic effects which stunts its growth

# Define time points
time <- seq(0, 24, by = 2)  # take samples every 2 hours over 24 hour period

# Define logistic growth function with cytotoxic effects
logistic_growth_cytotoxic <- function(t, a, b, k, n0, cytotoxic_effect) {
  growth_rate <- k - cytotoxic_effect * t  # Decrease growth rate linearly with time
  a + (b - a) / (1 + exp(-growth_rate * (t - n0)))
}

# Simulate bacterial growth with cytotoxic effects
cytotoxic_effect <- 0.005 * time  # Define cytotoxic effect: growth rate decreases linearly with time
# create a chart with the growth data: one line is time, the other is logistic growth including cytotoxin
growth_data <- data.frame(Time = time, lg = logistic_growth_cytotoxic(time, a = 0.05, b = 0.2, k = 0.1, n0 = 0.01, cytotoxic_effect))

# Plot simulated bacterial growth curve with cytotoxic effects
plot(growth_data$Time, growth_data$lg, type = "l", xlab = "Time (hours)", ylab = "Optical Density", main = "Simulated Bacterial Growth Curve with Cytotoxic Effects")
#we use optical density as the label for growth, because it's what bacteria growth we can see in the petri dish with our eyes 
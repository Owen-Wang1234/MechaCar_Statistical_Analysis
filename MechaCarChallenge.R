library(dplyr)

# Import the MechaCar mpg data.
mechacar_mpg <- read.csv("MechaCar_mpg.csv")

# Generate the linear regression model.
mpg_model <- lm(mpg ~ vehicle_length + vehicle_weight +
                  spoiler_angle + ground_clearance + AWD, mechacar_mpg)

# Summarize the model.
mpg_summ <- summary(mpg_model)

# Display the summary.
mpg_summ

# Provide reinforcing plots.
library(ggplot2)
ggplot(mechacar_mpg, aes(vehicle_length, mpg)) + geom_point()
ggplot(mechacar_mpg, aes(vehicle_weight, mpg)) + geom_point()
ggplot(mechacar_mpg, aes(spoiler_angle, mpg)) + geom_point()
ggplot(mechacar_mpg, aes(ground_clearance, mpg)) + geom_point()
ggplot(mechacar_mpg, aes(AWD, mpg)) +
  geom_boxplot(aes(group = cut_width(AWD, 1))) + geom_point()

# Import the Suspension Coil data.
coil_data <- read.csv("Suspension_Coil.csv")

# Get the total summary of all the coils.
total_summary <- coil_data %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

# Get the lot summary of the coils.
lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

# Plot the data points.
ggplot(coil_data, aes(PSI)) +
  geom_histogram(aes(fill = Manufacturing_Lot), bins = 50) +
  facet_wrap(vars(Manufacturing_Lot), scales = "free_x", strip.position = "top") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

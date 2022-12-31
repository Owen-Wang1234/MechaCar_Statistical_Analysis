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

# Show the correlations.
cor(mechacar_mpg$vehicle_length, mechacar_mpg$mpg)
cor(mechacar_mpg$vehicle_weight, mechacar_mpg$mpg)
cor(mechacar_mpg$spoiler_angle, mechacar_mpg$mpg)
cor(mechacar_mpg$ground_clearance, mechacar_mpg$mpg)
cor(mechacar_mpg$AWD, mechacar_mpg$mpg)

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

# Perform One-Sample T-Test: Suspension Coil Production vs. Baseline (1500 PSI).
ttotal <- t.test(coil_data$PSI, mu = 1500)

# Get the individual production lots.
lot1 <- coil_data %>% filter(Manufacturing_Lot == "Lot1")
lot2 <- coil_data %>% filter(Manufacturing_Lot == "Lot2")
lot3 <- coil_data %>% filter(Manufacturing_Lot == "Lot3")

# Perform One-Sample T-Test: Production Lot 1 vs. Baseline (1500 PSI).
tlot1 <- t.test(lot1$PSI, mu = 1500)

# Perform One-Sample T-Test: Production Lot 1 vs. Baseline (1500 PSI).
tlot2 <- t.test(lot2$PSI, mu = 1500)

# Perform One-Sample T-Test: Production Lot 1 vs. Baseline (1500 PSI).
tlot3 <- t.test(lot3$PSI, mu = 1500)

# Print out the results.
ttotal
tlot1
tlot2
tlot3

# Perform Paired T-Test: Lot 1 vs. Lot 2
tpair1 <- t.test(lot1$PSI, lot2$PSI, paired = T)

# Perform Paired T-Test: Lot 1 vs. Lot 3
tpair2 <- t.test(lot1$PSI, lot3$PSI, paired = T)

# Perform Paired T-Test: Lot 2 vs. Lot 3
tpair3 <- t.test(lot2$PSI, lot3$PSI, paired = T)

# Print out the results.
tpair1
tpair2
tpair3

# Get Lot and PSI.
coil_filt <- coil_data[, c("Manufacturing_Lot", "PSI")]

# Conduct the One-Way ANOVA test.
coilvar <- aov(PSI ~ Manufacturing_Lot, data = coil_filt)

# Present the results.
summary(coilvar)

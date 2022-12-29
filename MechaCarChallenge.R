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

# Import the Suspension Coil data.
coil_data <- read.csv("Suspension_Coil.csv")

# Get the total summary of all the coils.
total_summary <- coil_data %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

# Get the lot summary of the coils.
lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

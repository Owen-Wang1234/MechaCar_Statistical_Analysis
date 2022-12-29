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

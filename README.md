# MechaCar_Statistical_Analysis

## Project Overview
The client has requested some statistical analyses of the various performance metrics of the prototypes of a new product, the MechaCar. The analyses include:

1. Estimation of the fuel efficiency (mpg) of the MechaCar prototypes using linear regression
2. Summary statistics on the various lots of suspension coils produced by the manufacturing team
3. T-tests on the lots of manufactured suspension coils vs. the general suspension coil
4. Any other potential statistical studies that illustrates how the MechaCar compares to other manufacturers

## Resources

- Data Sources: MechaCar_mpg.csv and Suspension_Coil.csv

- Software: R 4.2.2 and RStudio 2022.12.0 Build 353

## Linear Regression to Predict MPG
One method of estimating the fuel efficiency (mpg) of the MechaCar prototype involves linear regression. This linear regression model uses all of the other columns in the imported dataset to determine which factor carries how much impact on fuel efficiency. The results are depicted as follows:

![Linear Regression Model of MechaCar MPG](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/linreg.png)

As shown in the depicted results, the primary factors that impact the fuel efficiency are the vehicle length and the ground clearance based on the significance of their p-values. The weight of the vehicle does appear to have some effect, but a p-value of ~0.07 implies that this might not be sufficiently impactful under conventional standards. The estimated coefficients of the selected factors are ~6.267 for vehicle length and ~3.546 for ground clearance, so the slope of the line would not be zero.

The p-value of the model is ~5.35*e-11, and the $R^2$ value of the model is ~0.7149 (Multiple) or ~0.6825 (Adjusted), implying that this linear model should fit the data reasonably well and should help predict the fuel efficiency of the prototypes. However, more in-depth investigation should be carried out to verify that certain factors impact fuel efficiency in a linear manner or to determine a better model that may not be linear.

## Summary Statistics on Suspension Coils
The suspension coil dataset is imported into R and summarized; one summary is prepared for the entire manufacturing group and another summary is prepared for each lot. The results are depicted as follows:

![Summary Statistics of Suspension Coils](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/summstats.png)

The requirements are that the variance of the suspension coils must not exceed 100 PSI. The entire manufacturing line appears to meet this requirement with a variance of ~62.3 PSI, but looking at them on a per-lot basis reveals discrepencies. The first lot looks perfect with a variance of just less than one, and the second lot looks very nice with a variance of ~7.47 PSI, but the third lot fails the requirement with a variance of ~170.29 PSI. In fact, Lot 3 appears to be a significant contribution to the total variance.
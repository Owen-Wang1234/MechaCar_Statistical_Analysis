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

![Linear Regression Model of MechaCar MPG](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/linreg.png)

As shown in the depicted results, the primary factors that impact the fuel efficiency are the vehicle length and the ground clearance based on the significance of their p-values. The weight of the vehicle does appear to have some effect, but a p-value of ~0.07 implies that this might not be sufficiently impactful under conventional standards. Based on the calculated p-values, so the slope of the line would not be zero for vehicle length and ground clearance. A quick check of the correlations for each factor reflect this.

![Correlations of Each Factor vs. MPG](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/corrs.png)

The plots below illustrate the strength of the relationship between the factor and the fuel efficiency (if such a relationship exists):

![MPG vs. Vehicle Length](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/mpg_vs_ln.png)

![MPG vs. Vehicle Weight](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/mpg_vs_wt.png)

![MPG vs. Spoiler Angle](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/mpg_vs_ang.png)

![MPG vs. Ground Clearance](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/mpg_vs_clr.png)

![MPG vs. AWD](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/mpg_vs_awd.png)

The p-value of the model is ~5.35*e-11, and the $R^2$ value of the model is ~0.7149 (Multiple) or ~0.6825 (Adjusted), implying that this linear model should fit the data reasonably well and should help predict the fuel efficiency of the prototypes fairly effectively. However, more in-depth investigation should be carried out to verify that these factors interact with each other in a linear manner or to refine the model without overfitting.

## Summary Statistics on Suspension Coils
The suspension coil dataset is imported into R and summarized; one summary is prepared for the entire manufacturing group and another summary is prepared for each lot. The results are depicted as follows:

![Summary Statistics of Suspension Coils](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/summstats.png)

The requirements are that the variance of the suspension coils must not exceed 100 PSI. The entire manufacturing line appears to meet this requirement with a variance of ~62.3 PSI, but looking at them on a per-lot basis reveals discrepencies. The first lot looks perfect with a variance of just less than one, and the second lot looks very nice with a variance of ~7.47 PSI, but the third lot fails the requirement with a variance of ~170.29 PSI. In fact, Lot 3 appears to be a significant contribution to the total variance. The histogram below reflects this:

![Suspension Coils Histogram](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/plots/psi_hist.png)

## T-Tests on Suspension Coils
The whole dataset is run through a two-tailed one-sample t-test to determine if the true mean PSI of the production line matches up with the designated population mean of 1,500 PSI. The dataset is then filtered by lots so that each lot is run through the same two-tailed one-sample t-test against the designated population mean. The results are depicted as follows:

![One-Sample T-Test Results](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/ttests.png)

The p-value of the production line mean indicates that the mean PSI of the production line is not statistically different from the designated mean. When looking at each individual lots, Lot 1 and Lot 2 are similar cases (interestingly, Lot 1 managed a t-value of zero to yield a p-value of one), but the p-value for Lot 3 indicates that the mean PSI for Lot 3 is statistically different from the designated mean (the confidence interval must misses the designated mean PSI of 1,500).

A series of paired t-tests compares the three lots to each other to drill down into the relationship of the means between lots.

![Paired Two-Sample T-Test Results](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/pairttests.png)

Based on the results and p-values, the mean PSI values for Lot 1 and Lot 2 are not statistically different from each other, but the mean PSI for Lot 3 stands out as statistically different from the mean PSI of either of the other two lots.

Another method of drilling into the relationship of the means between lots involves extracting the lot and PSI to run through a one-way analysis of variance (ANOVA) test:

![One-Way ANOVA Test Results](https://github.com/Owen-Wang1234/MechaCar_Statistical_Analysis/blob/main/statistic/anova.png)

The p-value is ~0.014, so the mean PSI values of the lots are not equal statistically. As previously demonstrated with the t-tests, the mean PSI for Lot 3 is the most likely suspect for this.
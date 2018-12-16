# Automated Feature Selection

Given a dataset and it's attributes, this R Shiny application determines the best model for the response variable given the set of attributes input. In data modelling, not all attributes are important with respect to a response variable. To determine the important variables, I have used the stepwise regression approach with Akaike Information Criterion (AIC) and Bayesian Information Criterion (BIC) which on each iteration remove a particular variable which is unimportant to the model and thereby reducing AIC/BIC on each iteration. 

The point where the stepwise regression is not able to further reduce AIC/BIC is chosen as the final model. I have used some of the built-in datasets in R such as 'iris' and 'areas' for the demonstration.

The Shiny application can be found here : https://shiivong27.shinyapps.io/Automated_Regression_and_Variable_Selection/

R packages used:

- shiny

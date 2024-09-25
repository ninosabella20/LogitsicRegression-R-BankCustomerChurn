# Customer Churn Prediction for a Bank

## Project Overview
This project focuses on predicting customer churn for a bank using logistic regression. The goal is to identify which customers are likely to leave the bank, allowing for targeted retention strategies. The dataset used contains 10,000 customer records and includes various demographic and transactional features.

## Dataset
The dataset used for this project can be found at the following link:
[Bank Customer Churn Dataset](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn)

### Dataset Details:
- **Total Customers:** 10,000
- **Churn Rate:** The dataset is relatively balanced in terms of churn (Exited: Yes or No).
- **Features Included:** The dataset includes various customer attributes such as demographics, account details, and service usage.

## Project Steps
1. **Data Import and Exploration:**
   - Loaded the dataset and inspected its structure.
   - Analyzed summary statistics and checked for missing values.

2. **Data Manipulation and Cleaning:**
   - Converted categorical variables to factors.
   - Handled missing values where necessary.
   - Conducted exploratory analysis to understand the distribution of features.

3. **Statistical Analysis:**
   - Generated a correlation matrix to inspect relationships between numerical features.
   - Created tables to inspect the percentage of churned customers based on different categorical factors.

4. **Modeling:**
   - Built a **Logistic Regression** model to predict customer churn.
   - Evaluated the model's performance using a confusion matrix and calculated key metrics.

## Model Results
### Confusion Matrix
- **True Positives (TP):** 396
- **True Negatives (TN):** 1600
- **False Positives (FP):** 0
- **False Negatives (FN):** 4

### Additional Performance Metrics
- **Accuracy:** 0.998
- **95% CI:** (0.9949, 0.9995)
- **No Information Rate:** 0.802
- **P-Value [Acc > NIR]:** < 2e-16
- **Kappa:** 0.9937
- **Mcnemar's Test P-Value:** 0.1336
- **Sensitivity:** 0.9975
- **Specificity:** 1.0000
- **Positive Predictive Value:** 1.0000
- **Negative Predictive Value:** 0.9900
- **Prevalence:** 0.8020
- **Detection Rate:** 0.8000
- **Detection Prevalence:** 0.8000
- **Balanced Accuracy:** 0.9988
- **'Positive' Class:** 0
- **Area Under the Curve (AUC):** 0.9994

## Conclusion
The logistic regression model achieved a high accuracy of 99.8%, indicating that it is effective in predicting customer churn. The results suggest that the bank can leverage this model to identify customers at risk of leaving and implement strategies to retain them.

## Future Work
- Explore other machine learning models (e.g., Random Forest, XGBoost) to potentially improve prediction accuracy.
- Perform hyperparameter tuning to optimize model performance.
- Conduct a deeper analysis of the feature importance to identify key factors influencing churn.

## Technologies Used
- R
- Packages: `caret`, `ggplot2`, `dplyr`, etc.

## Author
Nino Sabella


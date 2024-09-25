library(tidyverse)
library(caret)
library(ggplot2)
library(corrplot)
library(pROC)

churn_data <- read.csv('Customer-Churn-Records.csv')

# Understand the structure of database
str(churn_data)
summary(churn_data)
colSums(is.na(churn_data))

# Encode categorical character variables
churn_data$Gender <- as.factor(churn_data$Gender)
churn_data$Geography <- as.factor(churn_data$Geography)
churn_data$Card.Type <- as.factor(churn_data$Card.Type)
churn_data$CreditScore <- as.factor(churn_data$CreditScore)

churn_data <- churn_data %>%
  mutate_if(is.character, as.factor) %>%
  mutate_if(is.factor, as.numeric)

# Remove useless rows for understanding the database
churn_data <- churn_data %>% select(-CustomerId,-Surname,-RowNumber)

# Plot Correlation Matrix
png("corrplot_large.png", width = 10000, height = 10000)
numeric_vars <- churn_data %>% select_if(is.numeric)
corr_matrix <- cor(numeric_vars)
corrplot(corr_matrix, method = "circle")

# Gender - Exit Relationship
churn_by_gender <- churn_data %>%
  group_by(Gender) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_gender)

# Age - Exit Relationship
churn_by_age <- churn_data %>%
  group_by(Age) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_age)

# Age - Exit Relationship
churn_by_age <- churn_data %>%
  group_by(Age) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_age)

# Balance - Exit Relationship
churn_by_balance <- churn_data %>%
  group_by(Balance) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_balance)

# Activity - Exit Relationship
churn_by_activity <- churn_data %>%
  group_by(IsActiveMember) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_activity)

# Complaints - Exit Relationship
churn_by_complain <- churn_data %>%
  group_by(Complain) %>%
  summarise(ChurnRate = mean(Exited == 1))
print(churn_by_complain)

# Split  data into training and testing sets (80-20 split)
set.seed(80)  
trainIndex <- createDataPartition(churn_data$Exited, p = 0.8, list = FALSE)
train_data <- churn_data[trainIndex, ]
test_data <- churn_data[-trainIndex, ]

# Logistic Regression Model
logistic_model <- glm(Exited ~ ., data = train_data, family = "binomial")

# Summary of the model
summary(logistic_model)

# Predict probabilities on the test set
test_data$predicted_prob <- predict(logistic_model, newdata = test_data, type = "response")

# Convert probabilities to binary outcomes (threshold = 0.5)
test_data$predicted_churn <- ifelse(test_data$predicted_prob > 0.5, 1, 0)

# Confusion matrix
confusionMatrix(as.factor(test_data$predicted_churn), as.factor(test_data$Exited))

# AUC-ROC Curve
roc_curve <- roc(test_data$Exited, test_data$predicted_prob)
plot(roc_curve, col = "blue", main = "AUC-ROC Curve")
auc(roc_curve)

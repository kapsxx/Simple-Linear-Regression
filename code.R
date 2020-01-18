# IN THIS CODE I WILL EXPLAIN THE METHOD OF PREDICTING DATA USING SIMPLE LINEAR REGRESSION IN A STEP-BY-STEP MANNER



# STEP - 1  :  IMPORTING THE DATASET

# For importing the dataset you can write the code or you can mannualy click on "Import Dataset" button in Rstudio.
# After clicking, choose "From Text(readr)" option.
# Browse the location of the dataset and click on "Import".


# STEP - 2  :  ENCODING CATEGORICAL DATA

# After importing the dataset, analyse the data and check for missing values. Since there is no missing value we can move further.
# Now check for any categorical data and encode it if there is any.
# Checking for categorical data is very important because statistical models are created for predicting values by using only numerical values.
# Since the dataset I have used does not contain any categorical data, so we move towards the next step.


# STEP - 3  :  FEATURE SCALING

# The next step is to scale the data.
# Scaling the data means converting the data in the range from 0 to 1. This is known as normalisation.
# But let me tell you that the function used for creating simple linear regression model takes care scaling automatically and we do not need to perform any feature scaling to the data.


# STEP - 4  :  SPLITTING THE DATA INTO TRAINING AND TEST DATASETS

# Now the next step is to split the dataset into training_set and test_set.
# For splitting the dataset we will use a library named as "caTools".
# For those who have installed the package, you can mannualy install it by going to "Packages" option on the console.
# Click on "Install" button and write the name of the package in "Packages" bar.
# Now click on "Install". It will take some time.
# After complete installation click on "caTools" from "User Library"
# You can also write the code instead of doing it mannualy.
#library('caTools')
set.seed(123)
split = sample.split(Salary, 
                     SplitRatio = 0.8)
# I have used a function named "sample.split()". It is used to split the dataset into training_set and test_set.
# This function consist of 2 main arguments namely : y, SplitRatio
# y = Vector that needs to be split into training_set and test_set.
# SplitRatio = Ratio in which "y" is to be split.
# Here I have split the vector "Salary" into a ratio of 80:20
# split is a logical vector that consist of "TRUE" and "FALSE"
#split
# [1]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
# [14]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
# [27]  TRUE  TRUE  TRUE  TRUE
training_set = Salary_Data[split==TRUE, ]
test_set = Salary_Data[split==FALSE, ]
# After splitting, all the values of Salary_Data which consist of "TRUE" values of "split" goes into the "trainig_set".
# And all the values of Salary_Data which consist of "FALSE" values of "split" goes into the "test_set".
n_test_set = test_set
# I have created a copy of "test_set" for further use which will be explained later in the code.


# STEP - 5  :  BUILDING A REGRESSION MODEL FOR TRAINING DATASET

# Now we will build a simple regression model for training_set.
# For this step I have used a function named "lm()".
model = lm(formula = Salary~.,
           data = training_set)
# This function consists of 2 arguments namely "formula" and "data".
# formula = The details of the model or formula
# data = The data which in which the formula is to be applied.


# STEP - 6  :  UNDERSTANDING STATISTICAL PROPERTIES OF THE MODEL

# Now for checking how good is my model, I have used a function named "summary()".
# This function tells us about the many statistical properties of the model.
#summary(model)

# Output of this command is shown below.
# Call:
#   lm(formula = Salary ~ ., data = training_set)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -7810.8 -3698.7   747.8  3046.1  8162.0 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)      26995.6     2262.0   11.93 4.42e-11 ***
#   YearsExperience   9152.3      364.8   25.09  < 2e-16 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 5260 on 22 degrees of freedom
# Multiple R-squared:  0.9662,	Adjusted R-squared:  0.9647 
# F-statistic: 629.6 on 1 and 22 DF,  p-value: < 2.2e-16

# This function tells us about many of the statistical properties of the model.
# But for now, just have a look at the "p-value".
# It is an important parameter.
# We normally take "p-value" < 0.05 to be significant.
# In this case, "p-value" is "2.2e-16", i.e., it is highly significant.


# STEP - 7  :  PREDICTING VALUES OF DEPENDENT VARIABLE

# Since the model is found to be significant, so we will move further.
# Now we have to predict the values of dependent variable and for this I have used a function named "predict()".
y_pred = predict(model, 
                 newdata = test_set)
# This function consists of 2 arguments namely "object" and "newdata".
# object = The linear model created on the basis of formula for training the dataset
# newdata = The dataset which is to be predicted
# The predicted values are stored in "y_pred".


# STEP - 8  :  BUILDING A DATASET INCLUDING PREDICTED VALUES

# Build a dataset including predicted values
n_test_set$p_Salary = as.integer(y_pred)
# I have added a collumn named "p_Salary" which consist of the predicted values.
# Since the predicted values consist of decimal values, so I have converted it into integers using function named "as.integer()".
# Now I have the dataset which consists of the independent variable, dependent variable and the variable including predicted values.
# The dataset created is named as "n_test_set".


# STEP - 9  :  VISUALIZING THE DATA

# Now finally we can plot the grapgh which will consist of a regression line(best fitting line) along with the actual values of the dependent variable.
# For visualizing the data I have used a library named "ggplot2".
#library("ggplot2")
ggplot()+
  geom_point(aes(x = n_test_set$YearsExperience, y = n_test_set$Salary), colour = 'red')+
  geom_line(aes(x = n_test_set$YearsExperience, y = n_test_set$p_Salary), colour = 'blue')+
  ggtitle('SIMPLE LINEAR REGRESSION MODEL', 'salary vs years of experience')+
  xlab('Years of Experience')+
  ylab('Salary')+
  xlim(c(2, 9))+
  ylim(c(35000, 115000))
# "geom_point(aes(x = ..., y = ...), colour = "...")" is used to plot a point graph.
# "aes" is known as aesthetics.
# Under "aes(x = ..., y = ...)", "x" is the variable at x-axis and "y" is the variable at y-axis.
# "colour" is used to define a specific colour to points.
# Similarly "geom_line()" is used to plot a line graph.
# "ggtitle()" is used to add a title and the sub-title to the graph respectively.
# Similary "xlab()" and "ylab()" is used to add x-label and y-label respectively.
# I have used "xlim()" and "ylim()" functions for putting range for the x-axis and y-axis respectively.
# Refer to the pdf file - "graph" for the points mentioned below.
# Keep a note that I have plotted a point graph for actual salary and years of experience.
# Whereas, I have plotted a line graph for predicted salary and years of experience.
# Remember that the variable consisting of years of experience is same for both the graph.
# I have attached the graph for the model. In the graph you can see, there is a blue line.
# This blue line is the regression line(best fitting line for the model). It represents the predicted salary with respect to the years of experience.
# You can also see the red colour points on the graph. These points represent the actual salary with respect to the years of experience.
# The distance between a point and the line is the residual error.
# Residual errors for each and every value can be calculated by finding the distance between every point and line separately.

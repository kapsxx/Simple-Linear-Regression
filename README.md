# Simple-Linear-Regression



Theoretical Illustration  :  

    Simple linear regression is a statistical method which is used for finding relationship between two continuous variables.
    It assumes that there is approximately a linear relationship between "x" and "y".
    There are two variables, one is the dependent variable("y") and the other is the independent variable("x"). 

Dependent variable - The variable whose values depend on any other variable/variables is known as dependent variable.

Independent variable - The variable whose values does not depend on any other variable is known as independent variable.

Simple linear regression is used to find a relationship between the dependent and the independent variable. It is important to know that simple linear regression method is not used to find the deterministic relationship. If one variable(independent variable) can accurately determine the other variable(dependent variable), then the relationship between the two variables is said to be deterministic. Simple linear regression is rather used to find the best relationship between the dependent and independent variable for predicting the future values of the dependent variable more accurately.


Mathematical Illustration  :  

    Simple linear regression is used to predict a quantitative outcome "y" on the basis of one single predictor variable "x".
    The main aim is to build a mathematical model that defines "y" as a function of the "x".
    The model thus created can be used to predict the future values of "y" on the basis of new values of "x".

Mathematically, linear regression can be written as  :  y = b0 + b1*x + e, where:

    b0 -> Intercept of the regression line i.e., value of "y" when "x" = 0
    b1 -> Slope of the regression line i.e., rate of change in "y" as "x" changes.
    e -> Residual error i.e., diference between original value of "y" and predicted value of "y"

b0 and b1 are known as coefficients or parameters that tells us how important is the term "x" for predicting "y".

Important property of b0  :  

    If there is no ‘b0’ term, then regression line will pass over the origin.

Important properties of b1  :  

    If b1 > 0, then "x" and "y" have a positive relationship i.e., as "x" increases, "y" also increases.
    If b1 < 0, then "x" and "y" have a negative relationship i.e., as "x" increases, "y" decreases.


Residual Sum of Squares(RSS) - The sum of the squares of the residual errors are known as the residual sum of squares or RSS.
Mathematically, RSS can be written as  :  RSS = e1^2 + e2^2 + e3^2 + ..... + en^2

Standard error(SE) - Standard error is defined as average distance that the observed values("y") fall from the regression line.
Mathematically, SE can be written  as  :  SE = (σ^2)/n

    σ -> Standard deviation
    n -> Total number of observations

For those who don't know what is standard deviation.
Standard Deviation(σ) - Standard deviation is a measure of how spread apart the data is from the mean. A low standard deviation indicates that the values tend to be close to the mean, while a high standard deviation indicates that the values are spread out over a wider range.

Mathematically, Standard deviation can be written  as  :  σ = √(Σ(x-x̄)^2/(n-1)) or (Σ(x-x̄)^2/(n-1))^(1/2)

    x -> value of variable "x"
    x̄ -> Mean value of variable "x"
    n -> Total number of observations

Residual standard error(RSE) - Residual Standard Error is defined as the average variation of points around the fitted regression line. It is used to evaluate the overall quality of the regression model. The lower the RSE, the better it is.

Mathematically, Residual standard error can be written  as  :  RSE = √(RSS/(n-1)) or (RSS/(n-1))^(1/2)

    RSS -> Residual sum of squares
    n -> Total number of observations


Visualization of predicted data via simple linear regression model  :  

    Visualization of data means expressing the data in the form of graphs, charts, etc.
    I have performed data visualization using "ggplot2" package, and the function used is "ggplot()".

The concept behind ggplot2 divides plot into three different fundamental parts  :  Plot = Data + Aesthetics + Geometry.

The principal components of every plot can be defined as follow:

    Data is a data frame
    Aesthetics is used to indicate x and y variables. It can also be used to control the color, the size or the shape of points,etc.
    Geometry defines the type of graph(histogram, box plot, line plot, density plot, dot plot, etc.)

syntax  :  

    ggplot()+
    geom_point(data = "data frame", aes(x = "variable-x", y = "variable-y"), colour = "...")+
    ggtitle("Main title", "Sub-title")+
    xlab("x-label")+
    ylab("y-label")+
    xlim(c("initial limit", "final limit"))+
    ylim(c("initial limit", "final limit"))


NOTE  :

    All the steps of the code have been explained in detail.
    Explanation is given in comments along with the code.
    All the pre-processing methods and the reasons why to choose them are also explained in the comments.
    Read each and every line of the code along with the comments.
    It will help you understand the concept of simple linear regression very easily.
    After going through the code, you will be able to perform simple linear regression very conveniently.

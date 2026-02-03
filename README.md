# Exploratory Data Analysis and Predictive Modeling of Network Traffic Behavior

## Overview
This repository contains the R source code and dataset used to perform exploratory data analysis (EDA) and predictive modeling on a network traffic dataset. The analysis focuses on understanding network traffic behavior and classifying traffic as normal or anomalous using statistical and machine learning techniques.

The accompanying academic report presents the interpretation and discussion of the results. This repository provides the reproducible analytical components only.

## Dataset
The dataset is provided in CSV format and contains network traffic features, including:

- `spkts` – source packet count  
- `dpkts` – destination packet count  
- `sbytes` – source byte count  
- `dbytes` – destination byte count  
- `label` – binary target variable indicating normal or anomalous traffic  

The dataset is loaded directly within the R script.

## Tools and Libraries
The analysis is implemented in R using the following libraries:

- tidyverse – data manipulation  
- ggplot2 – data visualization  
- corrplot and ggcorrplot – correlation analysis  
- cluster – k-means clustering  
- MASS – logistic regression  
- caret – regression support  

## Exploratory Data Analysis
Initial data exploration includes inspection of dataset structure, summary statistics, and variable distributions. Visual techniques such as histograms, boxplots, scatter plots, and line plots are used to identify patterns, skewness, and potential outliers within network traffic variables.

## Correlation Analysis
A correlation matrix is generated using numeric variables to assess the strength and direction of linear relationships. Visual correlation plots and scatterplot matrices support the identification of strongly related features such as source and destination bytes.

## Clustering Analysis
K-means clustering is applied to numeric features to identify distinct traffic behavior patterns. Three clusters are generated to group similar observations, and results are visualized using packet-based feature comparisons.

## Predictive Modeling
Two predictive models are developed to classify the binary target variable (`label`):

- **Multiple Linear Regression (MLR)** to examine linear relationships between predictors and the target variable.
- **Logistic Regression (LR)** to perform binary classification of network traffic behavior.

Model summaries and equations are generated to evaluate predictor significance and model suitability. Logistic regression demonstrates improved performance for classification tasks.

## Purpose
The purpose of this repository is to support reproducibility and transparency of the analytical methods used in the academic study of network traffic behavior and risk identification.

## Repository Contents
- R script containing full analysis and models  
- Network traffic dataset (CSV)  
- README documentation  

## Declaration
This repository contains original academic work submitted in accordance with institutional academic integrity and assessment guidelines.
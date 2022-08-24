# Load libraries needed
if(!require(epiDisplay)) {
  install.packages("epiDisplay") 
  require(epiDisplay)
}
if(!require(psych)) {
  install.packages("psych") 
  require(psych)
}

# Load your data
class_data = readRDS("Fall22ClassData.rds")

# Inspect your data
summary(class_data)

# Frequency tables & Bar Charts (Any Data)
tab1(class_data$eye_color)

tab1(class_data$want_to_help)

tab1(class_data$like_football)
tab1(cut(class_data$like_football, breaks = 10))


# Histograms (Numeric Only)
hist(class_data$like_football, breaks = 10)
hist(as.numeric(class_data$like_football))


# Box Plots (Numeric Only)
boxplot(class_data$like_football)
boxplot(class_data$like_dnd)



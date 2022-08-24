# Import Class Data
class_data = read.csv("Class Data.csv")

# Show first 6 rows
head(class_data)

# Rename columns
new_col_names = c(
  "want_to_help", "want_to_therapy", "want_to_science", "want_to_fun",
  "conf_math", "conf_symb_log", "conf_real_log", "conf_sci_meth", "conf_writing", "conf_sci_reading", "conf_govmt", "conf_vacc", "conf_excel", "conf_prog", "conf_arts",
  "like_dog", "like_cat", "like_snake", "like_turtle", "like_bat", "like_dolphin", "like_dnd", "like_toenail", "like_football", "like_olympics", "like_pie", "like_pi",
  "gender", "pronouns",
  "handedness",
  "hispanic", "ethnicity",
  "hair_color", "eye_color",
  "siblings",
  "job",
  "caffeine",
  "grade_predict",
  "units",
  "hrs_tv", "hrs_reading",  "hrs_working", "hrs_sleeping", "hrs_school_work", "hrs_excersize", "hrs_other",
  "hrs_per_day",
  "hs_gpa",
  "exam_option",
  "final_exam_pref"
)
colnames(class_data) = new_col_names

# Show first 6 rows
head(class_data)

# Show Summary
summary(class_data)

# fix data-types
likerts  = c(1:4)
nominals = c(28:34,36,37,49,50)
yes_nos  = c(36, 37, 50)

for (i in 1:length(new_col_names)){
  if(i %in% likerts) class_data[,i] = factor(class_data[,i], ordered = T,
                                            levels = c(1:5),
                                            labels = c("Strongly Disagree", 
                                                       "Somewhat Disagree",
                                                       "Neither Agree nor Disagree",
                                                       "Somewhat Agree",
                                                       "Strongly Agree"))
  else if(i %in% nominals) {
    if (i %in% yes_nos) class_data[,i]                                 = factor(class_data[,i], levels = c(1:2), labels=c("Yes", "No"))
    else if (colnames(class_data)[i] == "gender") class_data[,i]       = factor(class_data[,i], levels = c(1:2), labels=c("Male", "Female"))
    else if (colnames(class_data)[i] == "pronouns") class_data[,i]     = factor(class_data[,i], levels = c(1:2), labels=c("he/him", "she/her"))
    else if (colnames(class_data)[i] == "handedness") class_data[,i]   = factor(class_data[,i], levels = c(1:2), labels=c("Right", "Left"))
    else if (colnames(class_data)[i] == "hispanic") class_data[,i]     = factor(class_data[,i], levels = c(1:2), labels=c("Non-Hispanic", "Hispanic"))
    else if (colnames(class_data)[i] == "ethnicity") class_data[,i]    = factor(class_data[,i], levels = c(2,3,5,7), labels=c("Asian", "Black", "White", "Two or more"))
    else if (colnames(class_data)[i] == "hair_color") class_data[,i]   = factor(class_data[,i], levels = c(1:2,4), labels=c("Blonde", "Brunette", "Other"))
    else if (colnames(class_data)[i] == "eye_color") class_data[,i]    = factor(class_data[,i], levels = c(1:3,6), labels=c("Blue", "Green", "Brown", "Hazel"))
    else if (colnames(class_data)[i] == "exam_option") class_data[,i]  = factor(class_data[,i], levels = c(1:3), labels=c("Online", "In-person", "No Preference"))
  }
  
}


# Check Summary again
summary(class_data)

# save data to .rds
saveRDS(class_data, "Fall22ClassData.rds")

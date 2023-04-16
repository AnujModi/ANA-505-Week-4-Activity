#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

data(Titanic)     #here data titanic is used to boot up titanic from basic R datasets... 
new_Titanic <- as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(Titanic)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
#install.packages("dplyr")        #this will install dplyr... but while working, and running it kept on giving prompt that
#dplyr is already installed... hence commenting it and writing below function
#here we can also check if we need to install the package here...:
if (!require("dplyr")) {
  install.packages("dplyr")
}
library(dplyr)      #calls dplyr

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanic_df_subset <- select(new_Titanic, Survived, Sex)  # Select only Survived and Sex columns
#head(titanic_df_subset, 32)
print(titanic_df_subset)    # to view all rows here... head will view only some rows unless we do the way i have done here


#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
titanic_surv_sex <- titanic_df_subset

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
titanic_surv_sex_no_sex <- select(titanic_surv_sex, -Sex)  # Exclude "Sex" column from dataframe


#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
titanic_surv_sex <- rename(titanic_surv_sex, Gender = Sex)  # Rename "Sex" column to "Gender"


#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
titanic_df_renamed <- titanic_surv_sex

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
male_df <- filter(titanic_df_renamed, Gender == "Male")  # Filter to only include rows where Gender is "male"


#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
titanic_df_arranged <- arrange(titanic_df_renamed, Gender)  # Arrange the data by Gender


#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
sum(new_Titanic$Freq)
#TASK: After you run it, write the total here:____2201
2201

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
female_df <- filter(titanic_df_renamed, Gender == "Female")


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(male_df, female_df)


#Optional Task: add any of the other functions 
#you learned about from the dplyr package
help("dplyr")
titanic_df_mutated <- mutate(new_Titanic, MF = ifelse(Sex == "Male", "Guga", "GuGi")) #adds new variables that are functions of existing variables
summarise(new_Titanic, MF = "Guga") #reduces multiple values down to a single summary.
arrange(titanic_df_mutated, desc(MF)) #changes the ordering of the rows.

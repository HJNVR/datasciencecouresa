Use the Week 1 Quiz Data Set(check folder) to answer questions 11-20.

11. In the dataset provided for this Quiz, what are the column names of the dataset? 
    > names(data)
    
12. Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
    > data[1:2,]
 
13. How many observations (i.e. rows) are in this data frame?
    > nrow(data)
    
14. Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
    > tail(data,2)
   
15. What is the value of Ozone in the 47th row?
    > data[47,"Ozone"]

16. How many missing values are in the Ozone column of this data frame?
    > sum(is.na(data["Ozone"]))

17. What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
   >Ozone <- is.na(data["Ozone"])
   >mean(data["Ozone"][!Ozone])
  
18. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
   >sub <- subset(data, Ozone > 31 & Temp > 90)
   >mean(sub$Solar.R)

19. What is the mean of "Temp" when "Month" is equal to 6? 
   >sub <- subset(data, Month ==6, select = Temp)
   >pply(sub,2,mean)

20. What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
   > sub <- subset(data, Month == 5 & !is.na(Ozone))
   > max(sub$Ozone

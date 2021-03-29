data <- read.csv("/Users/Starkjing/Desktop/学习/R/Quiz1/hw1_data.csv")
# get all the column names of the dataset
names(data)
# extract the first 2 rows of data
print(data[1:2,])

# number of rows in the data
nrow(data)

# get the last two rows of the data
tail(data, 2)

data[47,"Ozone"]
data[47,]

sum(is.na(data["Ozone"]))

Ozone <- is.na(data["Ozone"])
Ozone
mean(data["Ozone"][!Ozone])

# Q18
sub <- subset(data, Ozone > 31 & Temp > 90)
mean(sub$Solar.R)

# Q19 
sub <- subset(data, Month ==6, select = Temp)
apply(sub,2,mean)

# Q20
sub <- subset(data, Month == 5 & !is.na(Ozone))
max(sub$Ozone)

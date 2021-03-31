# T1
setwd("/Users/Starkjing/Desktop/学习/R Programming/Week2/") # must

pollutantmean <- function(directory, pollutant, id = 1:332){
  means <- c()
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data <- read.csv(path)
    data <- data[pollutant]
    means <- c(means, data[!is.na(data)])
  }
  
  mean(means)
              
}
pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "sulfate", 34)

pollutantmean("specdata", "nitrate")

complete <- function(directory, id = 1:332){
results <- data.frame(id=numeric(0), nobs=numeric(0))
for(monitor in id){
  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
  monitor_data <- read.csv(path)
  interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
  interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
  nobs <- nrow(interested_data)
  results <- rbind(results, data.frame(id=monitor, nobs=nobs))
}
results
}
complete("specdata", c(2, 4, 8, 10, 12))
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
print(cc$nobs)    

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

corr <- function(directory, threshold = 0){
  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  #print(complete_cases["id"])
  #print(unlist(complete_cases["id"]))
  #print(complete_cases$id)
  
  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      #print(path)
      monitor_data <- read.csv(path)
      #print(monitor_data)
      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}
  
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

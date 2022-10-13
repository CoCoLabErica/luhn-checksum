# Calculates the Luhn checksum for a given number x (double the value of every other digit from right to left by default)
checksum <- function(x,double_position=""){
  if (double_position == "odd") { double_position_remainder <- 1 }
  else if (double_position == "even") { double_position_remainder <- 0 }
  else { double_position_remainder <- nchar(x) %% 2 }
  
  doubling_array <- c()
  remaining_array <- c()
  
  for (i in 1:nchar(x)){
    if (i %% 2 == double_position_remainder) { doubling_array <- c(doubling_array, as.numeric(substr(x, i, i))) }
    else { remaining_array <- c(remaining_array, as.numeric(substr(x, i, i))) }
  }
  
  for (i in 1:length(doubling_array)){
    result <- 2 * doubling_array[i]
    if (result >= 10) { result <- (result %% 10) + 1 }
    doubling_array[i] <- result
  }
  
  merged_array <- c(doubling_array, remaining_array)
  sum <- 0
  for (i in 1:length(merged_array)){
    sum <- sum + merged_array[i]
  }
  
  return ((10 - (sum %% 10)) %% 10)
}

# Examples
checksum("462474823324978")
checksum("7992739871")
checksum("7992739871",double_position="odd")
checksum("546046280340313")
checksum("492990365278615")


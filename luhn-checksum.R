# A recursive function that calculates the digit sum for a given number n 
digitsum <- function(n){
  if (n < 10) { return (n) }
  else { return ((n %% 10) + digitsum(floor( n / 10 ))) }
}

# Calculates the Luhn checksum for a given number x (double the value of every other digit from right to left by default)
checksum <- function(x,double_position=""){
  if (double_position == "odd") { double_position_remainder <- 1 }
  else if (double_position == "even") { double_position_remainder <- 0 }
  else { double_position_remainder <- nchar(x) %% 2 }
  
  doubling_digits <- c()
  remaining_digits <- c()
  
  for (i in 1:nchar(x)){
    if (i %% 2 == double_position_remainder) { doubling_digits <- c(doubling_digits, as.numeric(substr(x, i, i))) }
    else { remaining_digits <- c(remaining_digits, as.numeric(substr(x, i, i))) }
  }

  doubling_digits <- 2 * doubling_digits
  # sapply will apply a function to all the elements of the input list/vector/df, and then output a vector/matrix
  doubling_digits <- sapply(doubling_digits, digitsum)

  all_digits <- c(doubling_digits, remaining_digits)
  all_digits_sum <- sum(all_digits)
  
  return ((10 - (all_digits_sum %% 10)) %% 10)
}

# Examples
checksum("462474823324978") # 0
checksum("7992739871") # 3
checksum("7992739871",double_position="odd") # 4
checksum("546046280340313") # 2
checksum("492990365278615") # 8


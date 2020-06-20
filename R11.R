print(rep(0,times=40))  # repeate 0 40 times

my_char <- c("My", "name", "is")
print(paste(my_char, collapse = " "))  # "My name is"  
print(paste(my_char, collapse = ""))   # "Mynameis"
paste("Hello", "world!", sep = " ")    # "Hello world!"


paste(1:3, c("X", "Y", "Z"), sep = "")  # "1X" "2Y" "3Z"


paste(1:3, c("X", "Y", "Z"),collapse = ",")  # "1 X,2 Y,3 Z"

paste(1:3, c("X", "Y", "Z"),sep = ",")       # "1,X" "2,Y" "3,Z"

paste(1:3, c("X", "Y", "Z"),collapse = ",",sep="-") # "1-X,2-Y,3-Z"
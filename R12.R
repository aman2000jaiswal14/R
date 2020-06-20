print(identical("abc","ABC"))  # FALSE
print(identical(1.0,1L))       # FALSE
print(identical("1",1))        # FALSE

x<-c(32,5,2,63,75,12,5,52,12,12,4,5,2)
print(which(x>12))  		 # 1 4 5 8 
      # gives the indices of vector 



print(xor(1,0))     # 1

y<-NA
print(isTRUE(y))    # False
       # used in compare true value when data contain NA values


"
&& compare 1'st element of a vector
&  compare  all element of a vector
simlarly for | and ||
"

s1<-"abc bcd"
s2<-"wxy xyz"
s3<-"mno nop"
print(class(s1))                 # "character"
print(paste(s1,s2,s3))		   # "abc bcd wxy xyz mno nop"
print(paste(s1,s2,s3,sep="-"))   # "abc bcd-wxy xyz-mno nop"
print(paste(s1,s2,s3,sep=""))	   # "abc bcdwxy xyzmno nop"

x=232.98706
y=2.3

print(format(x,digit=5))   	   # "232.99"
    #digits is the total number of digits displayed
print(format(y,digit=5))         # "2.3"    

print(format(x,nsmall=3))	   # "232.9871"
    #nsmall is the minimum number of digits to the right of the decimal point
print(format(y,nsmall=3))        # "2.300" 

print(format(x,scientific=TRUE)) # "2.329871e+02"

print(class(format(x,digit=5)))  # character

print(format(13.7, width = 6))   # "  13.7"

format("Hello", width = 8, justify = "c")  # " Hello  "
	                           # values are l,c,r

print(nchar("Count the number of characters"))  # 30
     					   # nchar - number of character

print(toupper("Count the number of characters")) 
print(tolower("Count the number of characters")) 
print(substring(s1, 5, 7)) 	   # "bcd"
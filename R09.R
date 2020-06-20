x<-readline()
print(x)
print(typeof(x))    # "character"
print(class(x))
y<-"abc 123"
print(strsplit(y," "))             # as a list
'
[[1]]
[1] "abc" "123"
'
print(strsplit(y," ")[[1]][[2]])  # "123"
   
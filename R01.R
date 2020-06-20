# to add to R console ----> source("R02.R")
# to know all the variable name use -- ls() or print(ls(pattern = "var")) 
## vector
print("vector---------------")
v1<-c(1,2,3,4)
v2<-3:10
print(class(v1))  # numeric  i.e numeric vector
print(class(v2))  # integer  i.e integer vector


## matrix
# matrix(data,nrow,ncol,byrow,dimnames)
print("Matrix------------------")
mtr <- matrix(1:9,3,3)
print(mtr)
"
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
"
M <- matrix(c(1:9), ncol = 3, byrow = TRUE)
print(M)
"
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
"

## array
# arr(data,dim,dimnames)
print("array------------------")
arr<-array(c(1:9),dim = c(3,3,4,2)) # 3 *3 matrix and 4 * 2 array
print(arr)

## list
# list(data)   -> value do not Coercion
print("list------------------")
l<-list(v1,v2,c("hello","hi"))
print(class(l))
print(class(c(v1,c("hello"))))
print(l)

##data.frame
#data.frame(data)
print("data.frame------------------")
vtr1 = c(1:5)
vtr2 = c("a","b","c","d","e")
df1 = data.frame(vtr1,vtr2)
print(df1)

##changing datatype of variable
print("changing datatype of variable--------------------------")
x<-2
print(x)
print(class(x))
print(typeof(x))
yn<-as.numeric(x)
yl<-as.logical(x)
cat("yn ",yn,fill=TRUE)  # USE FOR PRINT
cat("yl ",yl,fill=TRUE)


## deleting variable
# rm()
ls()
rm(v1)
ls()










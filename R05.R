## missing values
# missing values are denoted by either by NA or NaN
# NaN value is also NA but converse is not true

x<-c(1,2,3,NA,NaN,5)

print(is.na(x))   # FALSE FALSE FALSE  TRUE  TRUE FALSE


print(is.nan(x))  # FALSE FALSE FALSE FALSE  TRUE FALSE

print("-------------------------------------- DataFrame")

## Dataframe

d <- data.frame(column1 =1:4, column2 =c(T,T,F,F))
print(d)
print(nrow(d))
print(ncol(d))


print("-------------------------------------- names")

## names

n <- 1:3
print(names(n)) # NULL

names(n) <- c("c1","c2","c3")

print(n)

print(names(n)) # "c1" "c2" "c3"

print("-------------------------------------- list names")

# list names

lx <- list(a = 1, b = 2, c = 3)
print(lx)

print("-------------------------------------- matrix names")

# matrix names

mx <- matrix(1:4,nrow=2,ncol=2)
dimnames(mx) <- list(c("a","b"),c("c","d"))  # (row_names,col_names)
print(mx)
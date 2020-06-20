## vector
print("vector----------------------")
print(seq(2,10,by=0.9))  # 2.0 2.9 3.8 4.7 5.6 6.5 7.4 8.3 9.2
v <- c(3,8,4,5,0,11, -9, 304,decreasing = FALSE)
print(sort(v))

# Converting list to vector
list1 <- list(1:5)
vv<-unlist(list1)
print(vv)



##matrix
print("matrix----------------------")
m <- matrix(nrow=3,ncol=2)
print(m)
print(dim(m))
print(attributes(m))

m2<- matrix(1:6,nrow=3,ncol=2)  # matrix are constructed by columns wise
print(m2)

print(identical(m,m2))
## reshaping matrix

m3<- 1:10
print(m3)
dim(m3) <- c(2,5)
print(m3)

## concatenation of two vector

# rbind  (row binding)

a<- 1:3
b<- 11:13

r <- rbind(a,b)
print(r)

# cbind  (column binding)

x <- 1:3
y <- 7:9
c <- cbind(x,y)
print(c)
 


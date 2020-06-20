## Reading Data faster

sample_data <- read.table('sample.csv',header=F,sep=',',nrows=4)
classes <- sapply(sample_data,class)

all_data<- read.csv('sample.csv',header=F,colClasses=classes)
print(all_data) 

print("----------------------------------------- dputing")
## dputing R Objects

y <- data.frame(a=1,b="a")
print(dput(y))

print("--------------------------- dput to file")

dput(y,file="y.R")
zy <- dget("y.R")
print(zy)

print("----------------------------------------- dumping")
## dumping can be used to deparsed multiple R object

dx <- "HEllo"
dy <- data.frame(a=2,b='c')
dump(c("dx","dy"),file="dump.R")
rm(dx,dy)  # for removing objects
source("dump.R")
print(dy)
print(dx)


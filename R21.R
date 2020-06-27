## R HDF5 (heirarchical data format)

# install.packages("BiocManager")
# BiocManager::install(c("rhdf5"))
# biocLite("rhdf5")
# library(rhdf5)


created = h5createFile("example.h5")
print(created)

created = h5createGroup("example.h5","abc")
created = h5createGroup("example.h5","def")
created = h5createGroup("example.h5","abc/ghi")
print(h5ls("example.h5"))
'
group name     otype dclass dim
0     /  abc H5I_GROUP           
1  /abc  ghi H5I_GROUP           
2     /  def H5I_GROUP     
'

print("---------------------------")

A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","abc/A")
B = array(seq(1,20,by=1),dim=c(5,2,2))
attr(B,"scale")<-"liter"
h5write(B,"example.h5","abc/ghi/B")
print(h5ls("example.h5"))
'
     group name       otype  dclass       dim
0        /  abc   H5I_GROUP                  
1     /abc    A H5I_DATASET INTEGER     5 x 2
2     /abc  ghi   H5I_GROUP                  
3 /abc/ghi    B H5I_DATASET   FLOAT 5 x 2 x 2
4        /  def   H5I_GROUP 

'

print("------------------------------------ write a dataset")
df = data.frame(1L:5L,seq(0,1,length.out=5),c("ab","cd","ef","gh","ij"),stringAsFactors=FALSE)
h5write(df,"example.h5","df")
print(h5ls("example.h5"))
'
     group name       otype   dclass       dim
0        /  abc   H5I_GROUP                   
1     /abc    A H5I_DATASET  INTEGER     5 x 2
2     /abc  ghi   H5I_GROUP                   
3 /abc/ghi    B H5I_DATASET    FLOAT 5 x 2 x 2
4        /  def   H5I_GROUP                   
5        /   df H5I_DATASET COMPOUND         5

'

print("-------------------------------------------------- reading data")
readA = h5read("example.h5","abc/A")
print(readA)
'
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

'

print("----------------------------------------------------")
h5write(c(11,12,13),"example.h5","abc/A",index=list(1:3,1))
print(h5read("example.h5","abc/A"))
'
     [,1] [,2]
[1,]   11    6
[2,]   12    7
[3,]   13    8
[4,]    4    9
[5,]    5   10

'
print(h5read("example.h5","abc/A",index = list(1:4,1)))  # read row 1:4 of column 1












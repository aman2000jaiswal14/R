## Dataframe

df <- data.frame(id<-c(1,2,3,4,5),
			name<-c('a','c','de','dc','ac'),
			val <-c(3.0,5.1,1.4,3.2,8.4)
			)

names(df)<-c("id","name","val") # alternative=>colnames(df)<-c("id","name","val"
print(head(df))
print("--------------------------- ")
print(str(df))
print("----------------------------")
print(summary(df))
print("-----------------------------")

# Adding column
df$Gender<-c('M','M','F','M','F')
print(df)
print("------------------------------")

print(df[2,3])  # 5.1
print(df[,3])   # 3.0 5.1 1.4 3.2 8.4
print(df[3,])   # gives dataframe 
"
  id name val Gender
3  3   de 1.4      F
"
print(df[3:5,2])  # "de" "dc" "ac"


print(subset(df,Gender=='M'))
"
  id name val Gender
1  1    a 3.0      M
2  2    c 5.1      M
4  4   dc 3.2      M
"



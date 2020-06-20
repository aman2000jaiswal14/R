## factor
# factor are used to represent categorical data.

x <- factor(c("yes","yes","no","yes","no"))
print(x)
"
yes yes no  yes no 
Levels: no yes
"

print("-------------------------------- table")

print(table(x))
"
 no yes 
  2   3 
"
print("-------------------------------- unclass ")

print(unclass(x))
'
2 2 1 2 1
attr(,"levels")
"no"  "yes"
'
print("-------------------------------- change order of levels ")
# change the order of levels

y <- factor(c("yes","no","yes","no"),levels=c("yes","no")) 
print(y)

print("-------------------------------- check is factor ")
# check is factor 
gender <- c("male","male","female","female","male","female","male")
print(is.factor(gender))

print("-------------------------------generating factor")
# generating factor
print(gl(2,4,labels=c("y","n")))   # 2 labels repeated 4 times
"
y y y y n n n n
Levels: y n
"



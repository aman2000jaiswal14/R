## function for operator
'%+%' <- function(x,y) paste(x,y,sep="")
print("a"%+%"b"%+%"C")

## unique
print(unique(c(3, 4, 5, 5, 5, 6, 6)))


## simulations
print('----------------------simulations----------------------------')
#sample
print(sample(1:6,4,replace=TRUE)) # 3 5 2 4

print(sample(c(0,1), 10, replace = TRUE, prob = c(0.3, 0.7)))

print("-----------------------------------rbinom")
print(rbinom(1, size = 10, prob = 0.7))          
		# prob contains probability of success 
print("------------------------------------------rnorm")

print(rnorm(10, 100, 25))
"
148.13815  64.79916 141.57094 141.00976  85.34207  93.83520  92.43980
83.11491 118.71782  97.11576
"
print("------------------------------------------rpois")
print(rpois(5, 10))                  # 15  7 12 12 10

print("------------------------------------------my_pois")
my_pois <- replicate(2, rpois(5, 10))
print(my_pois)
cm <- colMeans(my_pois)
print("------------------------------------------my_pois, colMeans")
print(cm)










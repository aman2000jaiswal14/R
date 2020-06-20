library(datasets)
data(cars)
print(head(cars))
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance"
		,main = "My Plot",sub = "My Plot Subtitle")

"
for color red use               ---->   col=2
for triangle points use         ---->   pch=2
"

# plot(cars, xlim = c(10, 15),col=2,pch=2)



# boxplot(formula = mpg ~ cyl, data = mtcars)

# hist(mtcars$mpg)


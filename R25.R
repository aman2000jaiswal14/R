set.seed(1)
library(reshape2)
data(mtcars)
print(head(mtcars,3))
'
               mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
'

print("--------------------------------------melt")
mtcars$carname<-rownames(mtcars)
carMelt<-melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
print(head(carMelt,3))
'
        carname gear cyl variable value
1     Mazda RX4    4   6      mpg  21.0
2 Mazda RX4 Wag    4   6      mpg  21.0
3    Datsun 710    4   4      mpg  22.8
'

print(tail(carMelt,3))
'
         carname gear cyl variable value
62  Ferrari Dino    5   6       hp   175
63 Maserati Bora    5   8       hp   335
64    Volvo 142E    4   4       hp   109
 
'

cylData<-dcast(carMelt,cyl~variable)   # by default by count
print(cylData)
'
  cyl mpg hp
1   4  11 11
2   6   7  7
3   8  14 14

'

cylDatamean<-dcast(carMelt,cyl~variable,mean)
print(cylDatamean)

'
  cyl      mpg        hp
1   4 26.66364  82.63636
2   6 19.74286 122.28571
3   8 15.10000 209.21429
'
print("---------------------------------------")
print("------------------------------------------------dplyr")

### dplyr packages

library(dplyr)
data(mtcars)
# Select------
print("-----------------select")
print(head(select(mtcars,cyl:hp),3))
'
                    cyl  disp  hp
Mazda RX4             6 160.0 110
Mazda RX4 Wag         6 160.0 110
Datsun 710            4 108.0  93

'

# filter------
print("-----------------filter")

car.f<-filter(mtcars,cyl==6 & hp==110)
print(head(car.f,3))
'
                mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4      21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag  21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1

'

# arrange------
print("-----------------arrange")

print(head(arrange(mtcars,drat),3))       # sort in order by drat
print(head(arrange(mtcars,desc(drat)),3))  # sort in descending order by drat 

# rename ---------------
print("-------------------rename")

carsDf<-rename(mtcars, milespergallon=mpg, weight=wt)  # newname  = oldname
print(head(carsDf,1))
'
          milespergallon cyl disp  hp drat weight  qsec vs am gear carb
Mazda RX4             21   6  160 110  3.9   2.62 16.46  0  1    4    4
'

# mutate ---------------
print("-------------------mutate")
carsDf<-mutate(mtcars, mpg_hp = rowSums(cbind(mpg,hp)))
print(head(carsDf,1))
'
  mpg cyl disp  hp drat   wt  qsec vs am gear carb mpg_hp
1  21   6  160 110  3.9 2.62 16.46  0  1    4    4    131
'
										
#chaining operator ----------------
print("--------------------------------------chaining operator")
pipelineoperator <-carsDf %>% mutate(gear_carb= rowSums(cbind(gear,carb)))%>%
					filter(wt==2.62)
print(head(pipelineoperator,1))
'
  mpg cyl disp  hp drat   wt  qsec vs am gear carb mpg_hp gear_carb
1  21   6  160 110  3.9 2.62 16.46  0  1    4    4    131         8
'

# summarize and View---------------
print("-------------------summarize and View")
summarize_data<-summarize(mtcars,mean_hp=mean(hp,na.rm=T),max_weight=max(wt,na.rm=T),median_mpg=median(mpg,na.rm=T))
print(summarize_data)

'
   mean_hp max_weight median_mpg
1 146.6875      5.424       19.2

'
View(summarize_data)    # a new window open with well tabelized data




## Merging data-----------------------------------------------


print("----------------------------------------------- Merging data")
df1<-data.frame(id=1:5,a1=10:6,b1=seq(5,10,length=5),c1=rnorm(5))
df2<-data.frame(id=1:5,a2=1:5,b1=seq(8,13,length=5),c2=rnorm(5))

mergedf<-merge(df1,df2,by.x="id",by.y="id",all=T)  # available in base r
print(mergedf)
'
  id a1  b1.x         c1 a2  b1.y         c2
1  1 10  5.00 -0.6264538  1  8.00 -0.8204684
2  2  9  6.25  0.1836433  2  9.25  0.4874291
3  3  8  7.50 -0.8356286  3 10.50  0.7383247
4  4  7  8.75  1.5952808  4 11.75  0.5757814
5  5  6 10.00  0.3295078  5 13.00 -0.3053884
'

print(intersect(names(df1),names(df2)))
'
"id" "b1"
'
print(merge(df1,df2))
'
[1] id b1 a1 c1 a2 c2
<0 rows> (or 0-length row.names)
'
print(merge(df1,df2,all=T))
	
'
   id    b1 a1         c1 a2         c2
1   1  5.00 10 -0.6264538 NA         NA
2   1  8.00 NA         NA  1 -0.8204684
3   2  6.25  9  0.1836433 NA         NA
4   2  9.25 NA         NA  2  0.4874291
5   3  7.50  8 -0.8356286 NA         NA
6   3 10.50 NA         NA  3  0.7383247
7   4  8.75  7  1.5952808 NA         NA
8   4 11.75 NA         NA  4  0.5757814
9   5 10.00  6  0.3295078 NA         NA
10  5 13.00 NA         NA  5 -0.3053884

'


## group_by-----------------------------------------
print("-----------------------------------group_by")
grouped_cyl<-group_by(mtcars,cyl)
print(summarize(grouped_cyl,mean(wt),n_distinct(gear)))
'
# A tibble: 3 x 3
    cyl `mean(wt)` `n_distinct(gear)`
  <dbl>      <dbl>              <int>
1     4       2.29                  3
2     6       3.12                  3
3     8       4.00                  2

'

View(summarize(grouped_cyl,mean(wt),n_distinct(gear)))


print("============================================ tidyr package")
### tidyr package

library(tidyr)          ##

## problem 1 ->Column headers are values, not variable names

print("---------------------------------------p1  gather")

students<-data.frame(grade=c('A','B','C','D','E'),male=c(5,4,8,4,5),female=c(3,1,6,5,5))
print(students)
'
  grade male female
1     A    5      3
2     B    4      1
3     C    8      6
4     D    4      5
5     E    5      5
'

print(gather(students,sex,count,-grade))
'
   grade    sex count
1      A   male     5
2      B   male     4
3      C   male     8
4      D   male     4
5      E   male     5
6      A female     3
7      B female     1
8      C female     6
9      D female     5
10     E female     5

'

## problem 2-> multiple variables are stored in one column
print("---------------------------------------p2  gather  separate")
student2 = data.frame(grade=c("A", "B", "C", "D"),male_1=c(7, 4, 7, 8),
	female_1=c(0, 0, 4, 2),male_2=c(5, 5, 5, 8 ),female_2=c(8,8,6,1,0))
print(student2)
'
  grade male_1 female_1 male_2 female_2
1     A      7        0      5        8
2     B      4        0      5        8
3     C      7        4      5        6
4     D      8        2      8        1
5     E      8        4      1        0
'

res<-gather(students2,sex_class,count,male_1:female_2)
print(res)
'
   grade sex_class count
1      A    male_1     7
....
6      A  female_1     0
....
11     A    male_2     5
....
16     A  female_2     8
....

'

print(separate(data=res,col=sex_class,into=c("sex","class")))
'
   grade    sex class count
1      A   male     1     7
2      B   male     1     4
3      C   male     1     7
....

'



## problem 3 ->  variables are stored in both rows and columns
print("---------------------------------------p3  gather  spread parse_number")

'
student3 -----
    name    test class1 class2 class3 class4 class5
1  Sally midterm      A   <NA>      B   <NA>   <NA>
2  Sally   final      C   <NA>      C   <NA>   <NA>
3   Jeff midterm   <NA>      D   <NA>      A   <NA>
4   Jeff   final   <NA>      E   <NA>      C   <NA>
5  Roger midterm   <NA>      C   <NA>   <NA>      B
6  Roger   final   <NA>      A   <NA>   <NA>      A
7  Karen midterm   <NA>   <NA>      C      A   <NA>
8  Karen   final   <NA>   <NA>      C      A   <NA>
9  Brian midterm      B   <NA>   <NA>   <NA>      A
10 Brian   final      B   <NA>   <NA>   <NA>      C


> gather(data = student3,key = class,value = grade,class1:class5,na.rm=T)

    name    test  class grade
1  Sally midterm class1     A
2  Sally   final class1     C
9  Brian midterm class1     B
10 Brian   final class1     B
....
> students3 %>%
        gather(class, grade, class1:class5, na.rm = TRUE) %>%
           spread( test,grade)

    name  class final midterm
1  Brian class1     B       B
2  Brian class5     C       A
3   Jeff class2     E       D
....

> library(readr)                     ##

> parse_number(class5)   # 5

> students3 %>%
  	gather(class, grade, class1:class5, na.rm = TRUE) %>%
  	spread(test, grade) %>%
 	mutate(class=parse_number(class))

    name class final midterm
1  Brian     1     B       B
2  Brian     5     C       A
3   Jeff     2     E       D
....

'


## problem 4 ->  multiple observational units are stored in the same table
print("--------------------------------------------------p4 select ")

'
> students4
    id  name sex class midterm final
1  168 Brian   F     1       B     B
2  168 Brian   F     5       A     C
3  588 Sally   M     1       A     C
4  588 Sally   M     3       B     C
5  710  Jeff   M     2       D     E
6  710  Jeff   M     4       A     C
7  731 Roger   F     2       C     A
8  731 Roger   F     5       B     A
9  908 Karen   M     3       C     C
10 908 Karen   M     4       A     A

| each id, name, and sex is repeated twice, which seems quite redundant. This
| is a hint that our data contains multiple observational units in a single
| table.

solution is simple to break table into groups of columns --
using select unique id name sex and id,class,midterm,final,midterm

'

## problem 5-> single observational unit is stored in multiple tables
print("---------------------------------------------------p5 bind_rows contains")

'
> passed
   name class final
1 Brian     1     B
2 Roger     2     A
3 Roger     5     A
4 Karen     4     A


> failed
   name class final
1 Brian     5     C
2 Sally     1     C
3 Sally     3     C
4  Jeff     2     E
5  Jeff     4     C
6 Karen     3     C

> bind_rows(passed,failed)
    name class final
1  Brian     1     B
2  Roger     2     A
3  Roger     5     A
4  Karen     4     A
5  Brian     5     C
6  Sally     1     C
....

#contains() function, which you'll
# find detailed in 'Special functions' section of select 

'






























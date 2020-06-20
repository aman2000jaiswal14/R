d1<-Sys.Date()
print(d1)                         # "2020-06-20"
print(class(d1))                  # "Date" 
print(unclass(d1))		    # 18433
      # print number of days reference to 1970-01-01


t1<-Sys.time()                    
print(t1)                         # "2020-06-20 18:16:07 IST"
print(class(t1))                  # "POSIXct" "POSIXt" 
print(unclass(t1))		    # 1592657168

t2<-as.POSIXlt(Sys.time())	
print(t2)				    # "2020-06-20 18:18:18 IST"
print(class(t2))			    # "POSIXlt" "POSIXt"
print("---------------------------------------------------------")
print(unclass(t2))		    # gives list  
'
> unclass(t2)
$sec
[1] 18.44437

$min
[1] 18

$hour
[1] 18

$mday
[1] 20

$mon
[1] 5

$year
[1] 120

$wday
[1] 6

$yday
[1] 171

$isdst
[1] 0

$zone
[1] "IST"

$gmtoff
[1] 19800

attr(,"tzone")
[1] ""      "IST"   "+0630"

'
print("----------------------------------------------")
print(str(unclass(t2)))
'
List of 11
 $ sec   : num 18.4
 $ min   : int 18
 $ hour  : int 18
 $ mday  : int 20
 $ mon   : int 5
 $ year  : int 120
 $ wday  : int 6
 $ yday  : int 171
 $ isdst : int 0
 $ zone  : chr "IST"
 $ gmtoff: int 19800
 - attr(*, "tzone")= chr [1:3] "" "IST" "+0630"
'

print("-------------------------------------------")
print(weekdays(d1))   # "Saturday"
print(months(t1))	    # "June"
print(quarters(t2))   # "Q2"


print("-------------------------------------------")
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
print(t4)             # "1986-10-17 08:24:00 IST"
print(class(t4))      # "POSIXlt" "POSIXt" 

print("--------------------------------------operation on time")
print(Sys.time() - t1)   # Time difference of 14.90483 mins
print(unclass(Sys.time() - t1)[[1]])   # 14.90483

print(difftime(Sys.time(), t1, units = 'days')) #Time difference of 0.01195972 days












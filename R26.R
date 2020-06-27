## regular expression string manipulation and date 

namevar1<-c("Address","direction","location.1","crossStreat","location.2")
namevar2<-c("solution_id","time_left")
namevar3<-c("abc123","123abd","345123","deabccd","bdbcd","3223412","1212332","abc")
sent1<-"this_is_R_editor"

print(tolower(namevar1))
print(toupper(namevar1))

print(strsplit(namevar1,"\\."))
		# form a list of output 
'
[[1]]
[1] "Address"

[[2]]
[1] "direction"

[[3]]
[1] "location" "1"       

[[4]]
[1] "crossStreat"

[[5]]
[1] "location" "2" 
'

print(sub("_","",namevar2))                  # "solutionid" "timeleft" 
		# replace "_" with "" in namevar2
		 			
print(sub("_"," ",sent1))                    # "this is_R_editor"
		# replace one "_" 
print(gsub("_"," ",sent1))                   # "this is R editor"
		# replace all "_"


print(grep("abc",namevar3,ignore.case=F))			   # 1 4 8
            # gives the indices that contains "abc" in namevar3
		# if no search found then gives integer(0)

print(grep("abc",namevar3,value=T))   # "abc123"  "deabccd" "abc" 
            # gives the value that contains "abc" in namevar3

print(grepl("123",namevar3))   #  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE
		# gives true and false value

## stringr package
print("---------------------------------------------------------stringr")

library(stringr)                       ##
name1 = "Hello world"
print(nchar(namevar2))                      # 11  9
print(substr(name1,2,5))                    # "ello"
print(paste("Hello","welcome",sep=" "))     # "Hello welcome"
print(paste0("Hello","Welcome"))  		  # "HelloWelcome"
print(str_trim("     Hello   world   "))    # "Hello   world"
          # trim start and end space



print("-----------------------------------------regular expression")

#  ^   - metacharacter represent start of a line
#  						^i in string("i am here")
#  $   - represent end of line
#     					 here$ in string("i am here")
#  [Aa][Bb] - either A or a followed by b or B 

#  [0-9][a-zA-z] -  digit followed by letter
  
#  [^?.]$     -  any string that does not end with question mark or period  	 
  
#  a.c       - . means any one character i.e a followed by any one character followed by c
  
#  flood|fire  - either flood or fire

#  ? - represent optional
#  \ - remove special meaning of metacharacter
#  	[Gg]eorge( [Ww]\.)? [[bB]]ush   -  match G or g followed by eorge followed by
#           " W or w followed by ."(optional) followed by " " followed by b or B
#		followed by ush
#     	match with "George w. bush" , "george W. Bush", "george Bush"
  
#  (.*) -  any character any number of time may be zero
#  (.+) -  any character any number of time at least one
  
#  {3} -  exactly 3 match  
# {3,} - 3 or more match
#  {1,5} - match min 1 and max 5 times
#        [Bb]( ){1,3}[Cc] -  B or b followed by " "(one to three time) followed 
#	     by C or c

#  ^s(.*)s - "sitting as starbucks"   match with whole string	
#  ^s(.*?)s -  "sitting as starbucks"  match with "sitting as"
    		
  


## Dates -----------------------------
print("-----------------------------------------------Dates")

d1 = date()
print(d1)               # "Sat Jun 27 12:07:16 2020"
print(class(d1))        # character
d2 = Sys.Date()
print(d2)       # "2020-06-27"
print(class(d2))  # Date

'
formate of date
%d -  day as number(0-31)
%a -  abbreviated weekday
%A - unabbreviated weekday
%m -  month(00-12)
%b - abbriviated month
%B - unabbriviated month
%y  - 2 digit year
%Y -  4 digit year
'
print(format(d2,"%a %b %d"))   # "Sat Jun 27"
x = c("1jan1960","2jan1960","31mar960","30jul1960")
z = as.Date(x,"%d%b%Y")
print(z)
'
"1960-01-01" "1960-01-02" "0960-03-31" "1960-07-30"
'
print(z[1]-z[2])  # Time difference of -1 days
print(as.numeric(z[1]-z[2]))     # -1
print(weekdays(d2))              # "Saturday"
print(months(d2))                # "June"
print(julian(d2))      # gives number of days from origin date                
'
[1] 18440
attr(,"origin")
[1] "1970-01-01"
'

print("----------------------------------- lurbridate package for dates")
library(lubridate)
print(ymd("20200627"))             # "2020-06-27"
		# convert any format to date
print(dmy("27/06/2020"))           # "2020-06-27"
print(mdy("06-27-2020"))	     # "2020-06-27"
print(ymd_hms("2020-06-27 10:15:03",tz="GMT"))     # "2020-06-27 10:15:03 GMT"

this_day<-today()
print(this_day)                    #  "2020-06-27"
print(wday(this_day))              #  7 
print(wday(this_day,label=T))      #  Sat
this_moment<-now()
print(this_moment)                 # "2020-06-27 12:43:30 IST"
print(hour(this_moment))           # 12

print(update(this_moment,hours=8,minutes=34,seconds=55))  # "2020-06-27 08:34:55 IST"

t1 <-ymd_hms("2020-06-29 03:26:43 EDT")
print(with_tz(t1,tz="GMT"))       # "2020-06-29 03:26:43 GMT"
t2<-ymd_hms("2020-06-30 21:24:43 GMT")
t3<-mdy("June 17, 2008",tz="Singapore")
how_long<-interval(last_time,arrive)
print(how_long)                        # 2008-06-17 +08--2020-06-30 21:24:43 +08
print(as.period(how_long))             # "12y 0m 13d 21H 24M 43S"















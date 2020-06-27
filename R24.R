#### Quick overview

set.seed(1)
##------  creating a dataframe
X<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X<-X[sample(1:5),];X$var2[1:3]=NA
print(X)
'
  var1 var2 var3
2    4   NA   15
5    2   NA   12
4    5   NA   14
3    3    9   11
1    1   10   13

'
print(X[which(X$var2>8),])     # Deal with NA values    
'
  var1 var2 var3
3    3    9   11
1    1   10   13
' 

print(sort(X$var2,decreasing=T,na.last=T))  # 10  9 NA NA NA
						# na.last send NA value to last

print(X[order(X$var2),])
'
  var1 var2 var3
3    3    9   11
1    1   10   13
2    4   NA   15
5    2   NA   12
4    5   NA   14
'
#---------------------- ordering with plyr library
print("---------------------- ordering with plyr library")
library(plyr)    ##
print(arrange(X,var1))           # sort dataframe X by var1
print(arrange(X,desc(var1)))     # sort in descending order



### --------------------------- Summarizing Data
print("--------------------------- Summarizing Data")

## --------------loading data
file_url="https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if(!file.exists('restaurants.csv')){
download.file(file_url,destfile='restaurants.csv')
}
resData<-read.csv('restaurants.csv')
print(head(resData,n=5))
print(names(resData))        
'
"name"    "zipCode"  "neighborhood"  "councilDistrict" "policeDistrict" 
"Location.1"  "X2010.Census.Neighborhoods"   "X2010.Census.Wards.Precincts"
"Zip.Codes"    

'
##------------------------- manipulating data

print("------------------------- manipulating data")
print(summary(resData))
print(str(resData))
print(quantile(resData$councilDistrict,na.rm=T))
'
  0%  25%  50%  75% 100% 
   1    2    9   11   14 
'
print(quantile(resData$councilDistrict,probs=c(0.2,0.7,0.85)))
'
20% 70% 85% 
  1  11  11 
'

print(table(resData$zipCode,useNA="ifany"))    # table does not count NA so use useNA

print(table(resData$councilDistrict,resData$zipCode))  # deal with two variable in table
'
     -21226 21201 21202 21205 .....
  1       0     0    37     0 .....
  2       0     0     0     3 .....
  3       0     0     0     0 .....
  4       0     0     0     0 .....
 ...     ...   ...   ...   ...

'
print(colSums(is.na(resData)))       
'
                        name                      zipCode 
                           0                            0 
                neighborhood              councilDistrict 
                           0                            0 
              policeDistrict                   Location.1 
                           0                            0 
  X2010.Census.Neighborhoods X2010.Census.Wards.Precincts 
                        1327                         1327 
                   Zip.Codes 
                        1327 

'

print(table(resData$zipCode %in% c('21212','21213')))
'
FALSE  TRUE 
 1268    59 
'


##----------------------- new data UCBAdmissions

print("----------------------- new data UCBAdmissions")
data(UCBAdmissions)
df = as.data.frame(UCBAdmissions)
print(summary(df))
print(names(df))              #  "Admit"  "Gender" "Dept"   "Freq" 
##-----------------------------------

# ------------------------------------------------- crosstabs
print("-------------------------------------- crosstabs")

xt<-xtabs(Freq~Gender +Admit,data=df)  
			# cross tabs data contain Freq and row is Gender col is Admit
print(xt)
'
        Admit
Gender   Admitted Rejected
  Male       1198     1493
  Female      557     1278

'
zt<-xtabs(Freq~.,data=df)
		 # Freq ~ . shows Freq over all columns
print(zt)
print(ftable(zt))  # summarize zt
'
                Dept   A   B   C   D   E   F
Admit    Gender                             
Admitted Male        512 353 120 138  53  22
         Female       89  17 202 131  94  24
Rejected Male        313 207 205 279 138 351
         Female       19   8 391 244 299 317

'
print(object.size(df))               # 2464 bytes
print(object.size(df),units="KB")    # 2.4 Kb

## --------------------------------------------restData 
print("--------------------------------------------restData")

x<-c(1,3,8,25,100)
print(seq(along=x))     # 1 2 3 4 5   
		  # useful in creating index along column


# ---------------------ifelse
print("---------------------ifelse")
resData$zipWrong  = ifelse(resData$zipCode<0,T,F)

print(table(resData$zipWrong,resData$zipCode<0))

'
        FALSE TRUE
  FALSE  1326    0
  TRUE      0    1
'

# ---------------------------creating categorical variables

print(" ---------------------------creating categorical variables")

resData$zipGroups=cut(resData$zipCode,breaks=quantile(resData$zipCode))
				# cut is used to break the columns at particular interval			

print(table(resData$zipGroups))	
'
(-2.123e+04,2.12e+04]  (2.12e+04,2.122e+04] (2.122e+04,2.123e+04] 
                  337                   375                   282 
(2.123e+04,2.129e+04] 
                  332 
'

#-----------------another way of cut
library(Hmisc)
resData$zipGroups = cut2(resData$zipCode,g=4)
print(table(resData$zipGroups))
'
[-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
           338            375            300            314 
'






















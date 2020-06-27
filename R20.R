### Database connection
## mysql
# library(RMySQL)

ucscdb<- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")

result<-dbGetQuery(ucscdb,"show databases;"); dbDisconnect(ucscdb);
print(result)

print("---------------------------------------------")

hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
alltables<- dbListTables(hg19)
print(length(alltables))                            # 12464

print('--------------------------------')
print(dbListFields(hg19,"affyU133Plus2"))  
'
[1] "bin"         "matches"     "misMatches"  "repMatches"  "nCount"     
 [6] "qNumInsert"  "qBaseInsert" "tNumInsert"  "tBaseInsert" "strand"     
[11] "qName"       "qSize"       "qStart"      "qEnd"        "tName"      
[16] "tSize"       "tStart"      "tEnd"        "blockCount"  "blockSizes" 
[21] "qStarts"     "tStarts"   
'
print("--------------------------------------")

print(dbGetQuery(hg19,"select count(*) from affyU133Plus2"))
'
  count(*)
1    58463
'
print("--------------------------")

affydata<-dbReadTable(hg19,"affyU133Plus2")
print(head(affydata))

print("--------------------------------------------")

query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query)
print(quantile(affyMis$misMatches))
'
  0%  25%  50%  75% 100% 
   1    1    2    2    3 
'

affyMisSmall<-fetch(query,n=10); dbClearResult(query);

print(dim(affyMisSmall))    # 10 22

dbDisconnect(hg19)

## Reading data from the web
con<-url("https://www.google.com")
htmlCode<-readLines(con)
close(con)
print(htmlCode)
'
 "<!doctype html><html itemscope=\"\" itemtype=\"http://schema.or ......
'
print("---------------------------------------------")

library(XML)     ##

library(RCurl)   ##

url<-"https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
geturl<- getURL(url)
html<-htmlTreeParse(geturl,useInternalNodes=T)
print(xpathSApply(html,"//title",xmlValue))
'
 "Jeff Leek - Google Scholar Citations"
'
print(xpathSApply(html, "//a[@class='gsc_a_ac gs_ibl']", xmlValue))
'
 [1] "1505" "1326" "1321" "1157" "643"  "577"  "433"  "363"  "329"  "292" 
[11] "282"  "266"  "264"  "176"  "168"  "167"  "167"  "161"  "156"  "141" 
'
print("--------------------------------------------------")

library(httr)      ##

html2 = GET(url)
content2=content(html2,as='text')
parsedHtml=htmlParse(content2,asText=T)
print(xpathSApply(parsedHtml,"//title",xmlValue))  #"Jeff Leek - Google Scholar Citations"


print("--------------------------- accessing websites with password")

# pg2=GET(path,authenticate("username","password"))

print("---------------------------")

# google = handle("https://google.com")
# pg1 = GET(handle=google,path="/")
# pg2 = GET(handle=google,path="search")


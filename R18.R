## reading json
# library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
print(names(jsonData))
'
"id"                "node_id"           "name"  
"full_name"         "private"           "owner" 
......
......
"forks"             "open_issues"       "watchers"         
"default_branch"  

'

print("----------------------------------------------------")
print(names(jsonData$owner))
'
"login"               "id"                  "node_id"  
........
'
print("-----------------------------------------------------")
print(jsonData$owner$login)


###  myjson<-toJSON(iris,,pretty=True) # change to json
###  iris<-fromJSON(myjson)            # convert to dataframe












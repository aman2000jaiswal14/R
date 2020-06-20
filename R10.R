"
list.files(path,pattern)   it gives the list of files at given path
"

print(args(list.files))  # gives the detail of argument of the function

'
dir.create("file") # create directory
file.create("f1.R") # create file
file.exists("f1.R")  # check files exists
file.info("f1.R")    # gives information
file.rename(original,new)
file.copy(original , new)  
file.path("folder1","floder2")  # "folder1/folder2"
-----file.path to make a platform-independent pathname

example-
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)


'



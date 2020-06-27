'
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="cameras.csv")
dateDownload<-date()

cameraData<-read.csv("cameras.csv",quote="",nrows=10,skip=4)
			#skip top 4 rows and give data 5:15
'

## Reading Excel file
'
library(xlsx)
colIndex<-2:4
rowIndex<-12:16
cameraData<-read.xlsx(path,sheetIndex=1,header=TRUE,colIndex=colIndex,rowIndex=rowIndex)

'


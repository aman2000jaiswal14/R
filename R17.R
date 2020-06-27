## Reading XML
# library(XML)
fileUrl<-"simplexml.xml"
doc <-xmlTreeParse(fileUrl,useInternal=TRUE)
rootnode<-xmlRoot(doc)
print(xmlName(rootnode))         # "breakfast_menu"

print(rootnode[[1]])
'
<food>
 <name>Belgian Waffles</name>
 <price>$5.95</price>
 <description>Two of our famous Belgian Waffles with plenty of real maple syrup</description>
 <calories>650</calories>
</food>
'

print(rootnode[[1]][[1]])        # <name>Belgian Waffles</name>

print(xmlSApply(rootnode,xmlValue))
'
                                                                                                                    food 
                              "Belgian Waffles$5.95Two of our famous Belgian Waffles with plenty of real maple syrup650" 
                                                                                                                    food 
                   "Strawberry Belgian Waffles$7.95Light Belgian waffles covered with strawberries and whipped cream900" 
                                                                                                                    food 
"Berry-Berry Belgian Waffles$8.95Light Belgian waffles covered with an assortment of fresh berries and whipped cream900" 
                                                                                                                    food 
                                               "French Toast$4.50Thick slices made from our homemade sourdough bread600" 
                                                                                                                    food 
                        "Homestyle Breakfast$6.95Two eggs, bacon or sausage, toast, and our ever-popular hash browns950" 

'
print(xpathSApply(rootnode,"//name",xmlValue))
'
"Belgian Waffles" , "Strawberry Belgian Waffles", "Berry-Berry Belgian Waffles", "French Toas", "Homestyle Breakfast"
 
'


## Reading HTML
'
fileUrl<-"view-source:https://www.espn.in/nfl/team/_/name/bal/baltimore-ravens"
doc<-htmlTreeParse(fileUrl,useInternal=TRUE)
score<-xpathSApply(doc,"//li[@class='score']",xmlValue)
teams<-xpathSApply(doc,"//li[@class='team-name']",xmlValue)
print(score)

print(teams)
'








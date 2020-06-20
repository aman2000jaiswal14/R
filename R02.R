# FLOOR DIVISION  %/%
# MODULO DIVISION %%
# EXPONENT         ^
# in operator      %in%
# matrix multiplication   %*%

## SWITCH 
switch(2,
	'1'=print("11"),
	'2'=print("12"),
	'3'=print("13"),
	print("invalid")  # default
)

## Loop 
# repeat
# for 
# while


# print(..., na.print ="abc999", print.gap = 2)
'
> print(a,na.print="-999",print.gap=2)
[1]     1     2  -999     4  -999     6     7

> print(a,right=TRUE)
[1]   "one"   "two" "three"

> a <- c(1:10000)
> print(a,max=10)
 [1]  1  2  3  4  5  6  7  8  9 10
 [ reached getOption("max.print") -- omitted 9990 entries ]

'
## Printing to a file.
'
R can also send the output to a file instead of the console
>df=data.frame(data)
> sink("output.txt")
> print(df)
> sink()
'

## cat  function to print strings
'
> cat("a","b","c")
a b c>
'

'
> cat("a","b","c",fill=TRUE)
a b c
>
'

'
> cat("a","b","c",sep=",",fill=TRUE)
a,b,c
'

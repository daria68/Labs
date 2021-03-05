s=str(input("str="))
sum=0
for x in s.split():
    if x.isnumeric():
        sum+=int(x)
    elif x[0]=='-' and x[1:].isnumeric():
        sum+=int(x)
print(sum)
import re
f=open('fisier','r')
cuv=input()
fraza=f.readline()
fraza=re.findall(r"[\w']+",fraza)
for x in fraza:
    ok=1
    for k in cuv:
        if k not in x:
            ok=0
    if ok==1:
        print(x)
f.close()
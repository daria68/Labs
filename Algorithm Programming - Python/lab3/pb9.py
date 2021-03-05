import operator
x=str(input('Numele fisierului este:'))
f=open(x,"r")
g=open('rime.txt','w')
x=f.readline()
l=[]
k=0
D={}
for i in x.split():
    for j in x.split():
        if i!=j:
            if i[len(i)-1]==j[len(j)-1] and i[len(i)-2]==j[len(j)-2]:
                l.append(j)
                x=x.replace(j,'')
    if l!=[]:
        l.append(i)
    x = x.replace(i, '')
    if l!=[]:
        D[k]=l
        k+=1
    l=[]
print(D)
for keys,values in D.items():
    w=sorted(values)
    print(str(w))
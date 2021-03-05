f=open('Student.txt','r')
t=[]
c=int(f.readline())
for x in f.readlines():
    x=x.replace(' ','*',1)
    x=x.split()
    x[0]=x[0].replace('*',' ')
    if int(x[2])>=c:
        x.append('Promovat')
    else:
        x.append('Nepromovat')
    t.append(tuple(x))
t=sorted(t,key=lambda k:int(k[1]))
v=[]
for i in range(len(t)):
    v.append(int(t[i][1]))
s={*v}
dict={k:[] for k in s }
aux=[]
for key,values in dict.items():
    for x in t:
        if int(x[1])==key:
            aux.append((x[0],x[2],x[3]))
    values.append(sorted(aux,key=lambda k:k[1],reverse=True))
    aux=[]
print(dict)


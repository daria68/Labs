f=open("cheltuieli.txt","r")
x=f.readline()
L=[]
sum=0
for y in x.split():
    if y.isdecimal()==True:
        L.append(int(y))
    elif y[0].isdigit()==True:
        nrnou=0
        pozpunct=y.index('.')
        putere=10**len(y[pozpunct+1:])
        for z in y.split('.'):
            nrnou=nrnou*10+int(z)
        L.append(nrnou/putere)
for i in range(0,len(L),2):
    sum+=L[i]*L[i+1]
print(sum)


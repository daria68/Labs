f=open('fisi.txt','r')
x=str(f.read())
x=x.split(' +')
L=[]
for k in x:
    aptilda=k.count('~')
    poz=k.index(":")
    cuv=k[1:poz]
    apcuv=0
    k = k.split()
    for l in k:
        if l == cuv:
            apcuv+=1
    t=(cuv,aptilda+apcuv)
    L.append(t)
print('a)Lista de arce:',L)


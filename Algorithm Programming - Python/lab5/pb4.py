f=open('bani.txt','r')
g=open('plata.txt','w')
L=[int(x) for x in f.readline().split()]
suma=int(f.readline())
w=''
L2=sorted(L,reverse=True)
for x in L2:
    k=0
    while x<=suma:
        k+=1
        suma-=x
    if k>0:
        w+=str(x)+'*'+str(k)
        if suma>0:
            w+=' + '
g.write(w)
f.close()
g.close()


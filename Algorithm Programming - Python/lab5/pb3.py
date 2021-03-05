f=open('cuburi.txt','r')
L=[]
n=int(f.readline())
comp=f.readlines()
for x in comp:
    t=x.split()
    L.append(tuple(t))
L2=sorted(L,key=lambda t: int(t[0]),reverse=True)
print(L2[0])
k=0
Inaltime=int(L2[0][0])
for i in range(1,n):
    if L2[i][0]<L2[k][1]:
        if L2[i][1]!=L2[k][1]:
            print(L2[i])
            Inaltime+=int(L2[i][0])
            k=i
print(Inaltime)
f.close()
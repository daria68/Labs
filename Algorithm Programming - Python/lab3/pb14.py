f=open('graf_in.txt','r')
g=open('graf_out.txt','w')
tip_graf=f.readline()
n=int(f.readline())
m=int(f.readline())
L=[]
i=0
for x in f.readlines():
    if i<m:
        x=x.split()
        L.append((x[0],x[1]))
        i+=1
    else:
        x=x.split()
        start=x[0]
        final=x[1]
g.write('a)Lista de muchii:')
g.write(str(L))
g.write('\n')

D={}
l=[]
for i in range(m):
    L.append((L[i][1],L[i][0]))

for i in range(1,n+1):
    for x in L:
        if int(x[0])==i:
            l.append(x[1])
        D[i]=l
    l=[]
for keys,values in D.items():
    values.sort()
g.write('b)Lista de adiacenta:')
g.write(str(D))
g.write('\n')
M=[0]*n
for i in range(n):
    M[i]=[0]*n
for x in L:
    M[int(x[0])-1][int(x[1])-1]=1
    M[int(x[1])-1][int(x[0])-1]=1
g.write('c)Matricea de adiacenta:')
g.write('\n')
for i in range(n):
    g.write(str(M[i]))
    g.write('\n')

BF=[]
BF.append((start,-1))
st=dr=0
while st<=dr:
    tata=BF[st][0]
    for fiul in D[int(tata)]:
        if fiul not in[nod for (nod, parinte) in BF]:
            BF.append((fiul, tata))
            dr += 1
    st+=1
g.write("d)BFS:")
for (nod,parinte) in BF:
    g.write(nod)
    g.write(" ")
g.write('\n')
DF=[]
vizitat=[]
DF.append(start)
vizitat.append(start)
while DF!=[]:
    tata=DF[-1]
    ok=1
    for fiul in D[int(tata)]:
        if fiul not in vizitat:
            ok=0
            break
    if  ok==0 and D[int(tata)!=[]]:
        DF.append(fiul)
        vizitat.append(fiul)
    else:
        DF.pop(-1)
for x in vizitat:
    x=int(x)
g.write("e)DFS:")
g.write(str(vizitat))
g.write('\n')

i=start
ll=[i]
k=0
while i!=final:
    k+=1
    i=BF[k][0]
    ll.append(i)
for i in range(len(ll)-1,0,-1):
    if M[int(ll[int(i)])-1][int(ll[int(i)-1])-1]!=1:
        ll.remove(ll[int(i)-1])
g.write("f)Drum de lungime minima:")
g.write(str(ll))

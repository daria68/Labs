f=open('activitati.txt','r')
g=open('intarzieri.txt','w')
nr_act=int(f.readline())
L=[]
for x in f.readlines():
    t=x.split()
    L.append(tuple(t))
#sortare dupa termenul limita
L2=sorted(L,key=lambda t:int(t[1]))
Intervale=[]
T=0
for x in L2:
    t=[T,T+int(x[0])]
    T=T+int(x[0])
    Intervale.append(tuple(t))
Intarziere=[]
for i in range(nr_act):
    Intarziere.append(max(0,Intervale[i][1]-int(L2[i][1])))
H=max(Intarziere)
for i in range(nr_act):
    w=''
    w+=str(Intervale[i])+' '+str(L2[i][1])+' '+str(Intarziere[i])
    g.write(w)
    g.write('\n')
g.write(str(H))
f.close()
g.close()





f=open('evenimente.txt','r')
g=open('sali.txt','w')
L=[]
for x in f.readlines():
    x=x.replace('-',' ')
    t=x.split()
    L.append(tuple(t))
#sortez dupa ora de start
L2=sorted(L,key=lambda t:t[0])
#in s vom retine ora de inceput a salii care se elibereaza cel mai devreme
s=''
ss=[]
nrs=0
new_L2=L2.copy()
afis=''
while new_L2!=[]:
    for x in L2:
        if s<=x[0]:
            ss.append(x)
            s=x[1]
            new_L2.remove(x)
            afis+=str(x)
    nrs+=1
    afis+='\n'
    s = ''
    ss = []
    L2=new_L2.copy()
g.write(str(nrs))
g.write('\n')
g.write(afis)
f.close()
g.close()
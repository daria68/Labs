def cmmdc(a,b):
    r = a % b
    while(r!=0):
        a=b
        b=r
        r = a % b
    return b
f=open('obiecte.txt','r')
g=open('rucsac.txt','w')
n=int(f.readline())
L=[]
i=0
for x in f.readlines():
    if i<n:
        x=x.split()
        w=(round(int(x[0])/int(x[1]),2))
        x.append(w)
        L.append(tuple(x))
        i+=1
    else:
        Gmax=int(x)
        afGmax=x+'='
Vmax=0
L2=sorted(L,key=lambda t:t[2],reverse=True)
for i in range(n):
    if Gmax>0:
        if Gmax>int(L2[i][1]):
            Gmax-=int(L2[i][1])
            Vmax+=int(L2[i][0])
        else:
            w=cmmdc(int(L2[i][1]),Gmax)
            numarator = int(Gmax)//w
            numitor = int(L2[i][1])//w
            Vmax += (int(L2[i][0])*numarator)//numitor
            Gmax=0
afVmax=''
g.write('greutate:')
g.write('\n')
for i in range(n-1):
    afGmax+=L2[i][1]
    afGmax+='+'
    afVmax+=L2[i][0]
    afVmax += '+'
afGmax+='('+str(numarator)+'/'+str(numitor)+')'+'*'+L2[n-1][1]
afVmax+='('+str(numarator)+'/'+str(numitor)+')'+'*'+L2[n-1][0]+'='+str(Vmax)
g.write(afGmax)
g.write('\n')
g.write('valoare obiecte din rucsac:')
g.write('\n')
g.write(afVmax)
f.close()
g.close()



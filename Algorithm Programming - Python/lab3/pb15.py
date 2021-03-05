f=open('persoane.in','r')
L=[]
for x in f.readlines():
    x=x.split()
    adresa={'oras':x[2],'strada':x[3],'numar':int(x[4])}
    D={'nume':x[0],'prenume':x[1],'adresa':adresa}
    L.append(D)
print(L)
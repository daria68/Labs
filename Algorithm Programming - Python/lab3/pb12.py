k=input()
contor=1
L=[]
while k!='-1':
    poz=k.index(" ")
    t=(int(k[:poz]),k[poz+1:],contor)
    contor+=1
    L.append(t)
    k=input()
print('a)Lista participantilor:',L)
S={x[0] for x in L}
print('b)Punctajele obtinute:',S)
D={}
l=[]
for x in S:
    for y in L:
        if y[0]==x:
            l.append((y[1],y[2]))
        D[x]=l
    l=[]
print(D)
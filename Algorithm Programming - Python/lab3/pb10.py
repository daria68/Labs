f=open('inventar.txt','r')
D={}
for x in f:
    x=x.split()
    D[x[0]]=x[1:]
print('a)',D)
for keys,values in D.items():
    k=values
    break
for keys,values in D.items():
    w=list(set(k) & set(values))
    k=w
print('b)Intersectia:',k)
for keys,values in D.items():
    k=values
    break
for keys,values in D.items():
    w=list(set(k) | set(values))
    k=w
print('c)Reuniunea:',k)
print('d)',end='')
for KEYS,VALUES in D.items():
    for keys, values in D.items():
        if values!=VALUES:
            k = values
            break
    for keys, values in D.items():
        if values != VALUES:
            w = list(set(k) | set(values))
            k = w
    W=list(set(VALUES)-set(k))
    if W==[]:
        print('Pentru',KEYS,':','Nu exista elemente exclusiviste!')
    else:
        print('Pentru',KEYS,':',W)
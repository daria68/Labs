def citire(n,v):
    n=int(input("n="))
    v =[0]*n
    for i in range(n):
        v[i]+=int(input())
    return n,v
def afisare(n,v):
    for i in range(n):
        print(v[i],end=' ')
def val_poz(v):
    nl=[]
    for x in v:
        if x>0:
            nl.append(x)
    return nl
def semn(n,v):
    for i in range(n):
        v[i]=-v[i]




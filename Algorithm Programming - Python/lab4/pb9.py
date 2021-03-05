def citire():
    global n
    n=int(input('n='))
    global L
    L=[]
    for i in range(n):
        x=int(input())
        L.append(x)
def poz(x,i,j):
    for k in range(i,j+1):
        if L[k]>x:
            return k
    return -1
citire()
if(poz(L[0],1,n-1)==-1):
    print("Da")
else:
    print("Nu")


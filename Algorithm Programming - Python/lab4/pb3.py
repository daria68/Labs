from math import *
def min_max(*args):
    if len(args)==0:
        return None
    else:
        m=inf
        M=-1
        for x in args:
            if x<m:
                m=x
            elif x>M:
                M=x
        return m,M
args=[8,9,5,4,2]
print('a)',min_max(*args))
f=open('numere.txt','r')
g=open('impartire.txt','w')
L=[]
for x in f.readline().split():
    L.append(int(x))
rez=min_max(*L)
cat=rez[1]/rez[0]
g.write(str(cat))




from collections import deque
from heapq import *
f=open('proiecte.txt','r')
g=open('profit.txt','w')
#coada de prioritati
L=[8,9,4,3,1,6]
heapify(L)
print(L)
Q=deque([])
A=[]
for x in f.readlines():
    x=x.split()
    x[1]=int(x[1])
    x[2]=int(x[2])
    A.append(x)
#sortarea lui A descrescator dupa deadline
A=sorted(A,key=lambda t:t[1],reverse=True)
T=A[0][1] #nr de proiecte
print(T)
Sol=[]
k=T
A=deque(A)
while(len(Q)<T):
    while A[0][1]>=k:
        Q.append(A[0])
        A.popleft()
    k-=1
print(Q)
while Q:
 Sol.append(Q.pop())
print(Sol)



from collections import deque
#f=open('spectacole.txt','r')
L=[2,4,5,6,2,1]
L=deque(L)
L.appendleft(12)
print(L)
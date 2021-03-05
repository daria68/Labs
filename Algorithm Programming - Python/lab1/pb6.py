n=int(input("n="))
ap=[0]*10
while n>0:
    ap[n%10]+=1
    n//=10
nmax=0
nmin=0
for i in range(10):
   for j in range(ap[9-i]):
       nmax=nmax*10+(9-i)
   for j in range(ap[i]):
       nmin=nmin*10+i
print(nmax, nmin)
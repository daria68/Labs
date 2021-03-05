n=int(input("n="))
v=[0]*n
for i in range(n):
    v[i]=float(input())
k=v[1]-v[0]
for i in range(n-1):
    if v[i+1]-v[i]>k:
        k=v[i+1]-v[i]
        pi=i
print(round(k,2),pi+1,pi+2)
